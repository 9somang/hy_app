import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/domain/jobhunting/jobhunt_provider.dart';
import 'package:new_project/utill/convert_utf8.dart';
import '../../controllers/dto/SaveReqDto.dart';
import '../../controllers/dto/UpdateReqDto.dart';
import '../post/post.dart';


class JobhuntRepository {
  final JobhuntProvider _jobhuntProvider = JobhuntProvider();

  Future<Post> Jobhuntsave(String title, String content, username)async{
    SaveReqDto saveReqDto = SaveReqDto(title, content, username);
    Response response = await _jobhuntProvider.Jobhuntsave(saveReqDto.toJson());
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("글쓰기 성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      print("글쓰기 실패");
      return Post();
    }
  }

  Future<Post> Jobhuntupdate(int id, String title, String content)async{
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response = await _jobhuntProvider.Jobhuntupdate(id, updateReqDto.toJson());
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1){
      print("수정성공");
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      print("수정실패");
      return Post();
    }
  }

  Future<int> deleteByJobhuntId(int id) async{
    Response response = await _jobhuntProvider.deleteByJobhuntId(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;  // 또는 code!;
  }

  Future<Post> findByhuntId(int id) async{
    Response response = await _jobhuntProvider.findByhuntId(id);
    dynamic body = response.body;
    // dynamic convertbody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code ==1) {
      Post post = Post.fromJson(cmRespDto.data);
      return post;
    }else {
      return  Post();
    }
  }

  Future<List<Post>> findAllJobhunting() async {
    Response response = await _jobhuntProvider.findAllJobhunting();
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }
  } //까지가 구직게시판 불러오기
}