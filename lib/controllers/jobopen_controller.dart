import 'package:get/get.dart';
import 'package:new_project/domain/jobopening/jobop_repository.dart';
import '../domain/post/post.dart';

class JobopenController extends GetxController {
  final JobopenRepository _jobopenRepository = JobopenRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobOpening();
  }

  Future<void> findAllJobOpening() async {
    List<Post> posts = await _jobopenRepository.findAllJobopening();
    this.posts.value = posts;
  }

  Future<void> findByopenId(int id) async {
    Post post = await _jobopenRepository.findByopenId(id);
    this.post.value = post;
  }

}