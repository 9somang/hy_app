import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/domain/freenotice/free_provider.dart';
import 'package:new_project/domain/post/post.dart';
import 'package:new_project/utill/convert_utf8.dart';


class FreeNorepository {
  final freeProvider _freeProvider = freeProvider();

  Future<List<Post>> findAllfreenotice()async{
    Response response = await _freeProvider.findAllfreenotice();
    dynamic body = response.body;
    print(convertUtf8ToObject(body));     // 응답되는 값 안깨지는지 확인
    dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
    //print(cmRespDto.code);
    //print(cmRespDto.msg);
    //print(cmRespDto.data.runtimeType);

    if(cmRespDto.code == 1){
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }
  }
}