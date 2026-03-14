import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/post_provider.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/post_card.dart';
import '../widgets/shimmer_post.dart';
import '../widgets/story_bar.dart';

class HomeFeedScreen extends ConsumerStatefulWidget {
  const HomeFeedScreen({super.key});

  @override
  ConsumerState<HomeFeedScreen> createState() => _HomeFeedScreenState();
}

class _HomeFeedScreenState extends ConsumerState<HomeFeedScreen> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.pixels >
          controller.position.maxScrollExtent - 500) {
        ref.read(postProvider.notifier).loadPosts();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final posts = ref.watch(postProvider);

    if (posts.isEmpty) {
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (_, __) => const ShimmerPost(),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: const Icon(CupertinoIcons.add, size: 28),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Instagram",
                  style: GoogleFonts.lobster(fontSize: 32, color: Colors.black),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
            actions: const [
              SizedBox(width: 15),
              Icon(CupertinoIcons.heart, size: 28),
              SizedBox(width: 15),
            ],
          ),
          SliverToBoxAdapter(child: const StoryBar()),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final post = posts[index];
              return PostCard(post: post);
            }, childCount: posts.length),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
