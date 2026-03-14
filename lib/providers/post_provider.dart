import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';
import '../repositories/post_repository.dart';

final repositoryProvider = Provider((ref) => PostRepository());

final postProvider = StateNotifierProvider<PostNotifier, List<Post>>((ref) {
  return PostNotifier(ref.read(repositoryProvider));
});

class PostNotifier extends StateNotifier<List<Post>> {
  final PostRepository repository;

  int page = 0;
  bool loading = false;

  PostNotifier(this.repository) : super([]) {
    loadPosts();
  }

  Future<void> loadPosts() async {
    if (loading) return;

    loading = true;

    final posts = await repository.fetchPosts(page);

    state = [...state, ...posts];

    page++;

    loading = false;
  }
}
