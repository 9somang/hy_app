import 'package:get/get.dart';
import 'package:new_project/domain/jobnotice/jobno_repository.dart';
import '../domain/post/post.dart';

class JobnoController extends GetxController {
  final JobnoRepository _jobnoRepository = JobnoRepository();
  final posts = <Post>[].obs;
  final post = Post().obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobnotice();
  }

  Future<void> findAllJobnotice() async {
    List<Post> posts = await _jobnoRepository.findAllJobNotice();
    this.posts.value = posts;
  }

  Future<void> findById(int id) async {
    Post post = await _jobnoRepository.findById(id);
    this.post.value = post;
  }

}