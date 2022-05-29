import 'package:flutter/services.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/controllers/dto/SaveReqDto.dart';
import 'package:new_project/domain/jobnotice/jobno_provider.dart';
import '../../controllers/dto/UpdateReqDto.dart';
import '../post/post.dart';

class JobnoRepository {
  final JobnoProvider _jobnoProvider = JobnoProvider();

  Future<Post> Jobnosave(String title, String content, username)async{
    SaveReqDto saveReqDto = SaveReqDto(title, content, username);
    Response response = await _jobnoProvider.Jobnosave(saveReqDto.toJson());
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

  Future<Post> Jobnoupdate(int id, String title, String content)async{
    UpdateReqDto updateReqDto = UpdateReqDto(title, content);
    Response response = await _jobnoProvider.Jobnoupdate(id, updateReqDto.toJson());
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

  Future<int> deleteByJobnoId(int id) async{
    Response response = await _jobnoProvider.deleteByJobnoId(id);
    dynamic body = response.body;
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    return cmRespDto.code ?? -1;  // 또는 code!;
  }

  Future<Post> findByJobnoId(int id) async{
    Response response = await _jobnoProvider.findByJobnoId(id);
    dynamic body = response.body;
    // dynamic convertBody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(body);

    if(cmRespDto.code == 1) {
        Post post = Post.fromJson(cmRespDto.data);
        return post;
    }else {
      return  Post();
    }
  }

  Future<List<Post>> findAllJobNotice() async {
    Response response = await _jobnoProvider.findAllJobNotice();
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

  }
}