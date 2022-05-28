import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/CMRespDto.dart';
import 'package:new_project/domain/jobnotice/jobno_provider.dart';
import 'package:new_project/utill/convert_utf8.dart';
import '../post/post.dart';



class JobnoRepository {
  final JobnoProvider _jobnoProvider = JobnoProvider();

  Future<Post> findById(int id) async{
    Response response = await _jobnoProvider.findByJobnoId(id);
    dynamic body = response.body;
    dynamic convertbody = convertUtf8ToObject(body);
    CMRespDto cmRespDto = CMRespDto.fromJson(convertbody);

    if(cmRespDto ==1) {
        Post post = Post.fromJson(cmRespDto.data);
        return post;
    }else {
      return  Post();
    }
  }

  Future<List<Post>> findAllJobNotice() async {
    Response response = await _jobnoProvider.findAllJobNotice();
    dynamic body = response.body;
    dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
    CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);

    if (cmRespDto.code == 1) {
      List<dynamic> temp = cmRespDto.data;
      List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
      return posts;
    } else {
      return <Post>[]; // 빈배열 호출
    }

  }
}