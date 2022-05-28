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

  Future<void> deleteByJobhuntId(int id) async{
    int result = await _jobhuntRepository.deleteByJobhuntId(id);

    if(result == 1){
      print("DB 삭제 성공");
      List<Post> result = posts.where((post) => post.id != id).toList();
      // print(result.length);
      posts.value = result;
    }
  }

  Future<void> findAllJobhunting() async {
    List<Post> posts = await _jobhuntRepository.findAllJobhunting();
    this.posts.value = posts;
  }

  Future<void> findByhuntId(int id) async {
    Post post = await _jobhuntRepository.findByhuntId(id);
    this.post.value = post;
  }

}