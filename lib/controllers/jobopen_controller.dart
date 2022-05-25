import 'package:get/get.dart';
import 'package:new_project/domain/jobopening/jobop_repository.dart';
import '../domain/post/post.dart';

class JobopenController extends GetxController {
  final JobopenRepository _jobopenRepository = JobopenRepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAllJobOpening();
  }

  Future<void> findAllJobOpening() async {
    List<Post> posts = await _jobopenRepository.findAllJobopening();
    this.posts.value = posts;
  }

}