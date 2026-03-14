import '../models/post.dart';

class PostRepository {

  Future<List<Post>> fetchPosts(int page) async {

    await Future.delayed(const Duration(milliseconds: 1500));

    return List.generate(10, (index) {

      return Post(
        id: "$page-$index",
        username: "user_$index",
        userImage: "https://i.pravatar.cc/150?img=$index",
        images: [
          "https://picsum.photos/500/700?random=${index+page}",
          "https://picsum.photos/500/700?random=${index+page+1}"
        ],
      );

    });
  }

}