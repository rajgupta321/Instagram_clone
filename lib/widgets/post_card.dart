import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import 'post_carousel.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(post.userImage)),
          title: Text(post.username),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("More options not implemented")),
              );
            },
          ),
        ),

        PostCarousel(images: post.images),

        Row(
          children: [
            IconButton(
              icon: Icon(
                post.isLiked ? Icons.favorite : Icons.favorite_border,
                color: post.isLiked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  post.isLiked = !post.isLiked;
                });
              },
            ),

            IconButton(
              icon: const Icon(CupertinoIcons.chat_bubble),

              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Comments not implemented")),
                );
              },
            ),

            IconButton(
              icon: const Icon(CupertinoIcons.paperplane),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Share not implemented")),
                );
              },
            ),

            const Spacer(),

            IconButton(
              icon: Icon(
                post.isSaved
                    ? CupertinoIcons.bookmark_solid
                    : CupertinoIcons.bookmark,
              ),
              onPressed: () {
                setState(() {
                  post.isSaved = !post.isSaved;
                });
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text("March 14", style: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
