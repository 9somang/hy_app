// import 'package:get/get.dart';
// import 'package:new_project/domain/post/post_repository.dart';
// import '../domain/post/post.dart';
//
//
// class PostController extends GetxController {
//   final PostRepository _postRepository = PostRepository();
//   final posts = <Post>[].obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     print("안녕");
//   }
//
//   Future<void> findAllJobnotice() async {
//     List<Post> posts = await _postRepository.findAllJobNotice();
//     this.posts.value = posts;
//   }
//
//   Future<void> findAllfreenotice() async {
//     List<Post> posts = await _postRepository.findAllJobNotice();
//     this.posts.value = posts;
//   }
//
//   Future<void> findAllJobopening() async {
//     List<Post> posts = await _postRepository.findAllJobNotice();
//     this.posts.value = posts;
//   }
//
//   Future<void> findAllJobhunting() async {
//     List<Post> posts = await _postRepository.findAllJobNotice();
//     this.posts.value = posts;
//   }
//
// }