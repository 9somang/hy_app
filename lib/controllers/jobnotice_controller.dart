import 'package:get/get.dart';
import 'package:new_project/domain/jobnotice/jobno_repository.dart';
import '../domain/post/post.dart';

class JobnoController extends GetxController {
  final JobnoRepository _jobnoRepository = JobnoRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobnotice();
  }

  Future<void> findAllJobnotice() async {
    List<Post> posts = await _jobnoRepository.findAllJobNotice();
    this.posts.value = posts;
  }

}