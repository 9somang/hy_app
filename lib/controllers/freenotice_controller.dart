import 'package:get/get.dart';
import 'package:new_project/NoticeBoard_pages/freenotice.dart';
import 'package:new_project/domain/freenotice/free_repository.dart';
import 'package:new_project/domain/jobhunting/jobhunt_repository.dart';
import '../domain/post/post.dart';

class FreenoticeController extends GetxController {
  final FreeNorepository _freeNoRepository = FreeNorepository();
  final posts = <Post>[].obs;

  @override
  void onInit() {
    super.onInit();
    findAllfreenotice();
  }

  Future<void> findAllfreenotice() async {
    List<Post> posts = await _freeNoRepository.findAllfreenotice();
    this.posts.value = posts;
  }

}