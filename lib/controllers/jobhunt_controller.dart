import 'package:get/get.dart';
import 'package:new_project/domain/jobhunting/jobhunt_repository.dart';
import '../domain/post/post.dart';

class JobhuntController extends GetxController {
  final JobhuntRepository _jobhuntRepository = JobhuntRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobhunting();
  }

  Future<void> findAllJobhunting() async {
    List<Post> posts = await _jobhuntRepository.findAllJobhunting();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _jobhuntRepository.findById(id);
    this.post.value = post;
  }

}