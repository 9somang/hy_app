import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/utill/convert_utf8.dart';
import 'package:new_project/domain/jobopening/jobop_provider.dart';
import '../../controllers/dto/SaveReqDto.dart';
import '../../controllers/dto/UpdateReqDto.dart';
import '../post/post.dart';

class JobopenRepository {
  final JobopProvider _jobopProvider = JobopProvider();

  Future<Post> Jobopensave(String title, String content,String username)async{
    SaveReqDto saveReqDto = SaveReqDto(title, content, username);
    Response response = await _jobopProvider.Jobopensave(saveReqDto.toJson());
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

  Future<Post> Jobopenupdate(int id, String title, String content)async{
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response = await _jobopProvider.Jobopenupdate(id, updateReqDto.toJson());
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

  Future<int> deleteByJobopenId(int id) async{
    Response response = await _jobopProvider.deleteByJobopenId(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;  // 또는 code!;
  }

  Future<Post> findByopenId(int id) async{
    Response response = await _jobopProvider.findByopenId(id);
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

  Future<List<Post>> findAllJobopening() async {
    Response response = await _jobopProvider.findAllJobopening();
    dynamic body = response.body;
   //  dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);


    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }
  } //까지가 구인게시판 불러오기
}