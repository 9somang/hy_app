
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/domain/jobnotice/jobno_provider.dart';
import 'package:new_project/utill/convert_utf8.dart';
import '../post/post.dart';



class JobnoRepository {
  final JobnoProvider _jobnoProvider = JobnoProvider();

  Future<List<Post>> findAllJobNotice() async {
    Response response = await _jobnoProvider.findAllJobNotice();
    print("test : ${response}");
    dynamic body = response.body;
    // 응답되는 값 안깨지는지 확인
    //dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(body);
    print("test : ${body}");

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }

  }
}