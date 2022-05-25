// import 'package:get/get_connect/http/src/response/response.dart';
// import 'package:new_project/controllers/dto/CMRespDto.dart';
// import 'package:new_project/domain/post/post_provider.dart';
// import 'package:new_project/utill/convert_utf8.dart';
// import 'post.dart';
//
// // 응답받은 데이터들을 엉터리인 상태에서 플러터에서 잘 쓸수 있도록 다트오브젝트로 바꿈: repository
//
// class PostRepository {
//   final PostProvider _postProvider = PostProvider();
//
//   Future<List<Post>> findAllJobNotice()async{
//     Response response = await _postProvider.findAllJobNotice();
//     dynamic body = response.body;
//     print(convertUtf8ToObject(body));     // 응답되는 값 안깨지는지 확인
//     dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
//     CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
//     //print(cmRespDto.code);
//     //print(cmRespDto.msg);
//     //print(cmRespDto.data.runtimeType);
//
//     if(cmRespDto.code == 1){
//       List<dynamic> temp = cmRespDto.data;
//       List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
//       return posts;
//     } else {
//       return <Post>[]; // 빈배열 호출
//     }
//   }//까지가 취업게시판 불러오기
//
//   Future<List<Post>> findAllJobopening()async{
//     Response response = await _postProvider.findAllJobopening();
//     dynamic body = response.body;
//     print(convertUtf8ToObject(body));     // 응답되는 값 안깨지는지 확인
//     dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
//     CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
//     //print(cmRespDto.code);
//     //print(cmRespDto.msg);     // 값 받음확인하는 용도 print
//     //print(cmRespDto.data.runtimeType);
//
//     if(cmRespDto.code == 1){
//       List<dynamic> temp = cmRespDto.data;
//       List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
//       return posts;
//     } else {
//       return <Post>[]; // 빈배열 호출
//     }
//   }//까지가 구인게시판 불러오기
//
//   Future<List<Post>> findAllJobhunting()async{
//     Response response = await _postProvider.findAllJobhunting();
//     dynamic body = response.body;
//     print(convertUtf8ToObject(body));     // 응답되는 값 안깨지는지 확인
//     dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
//     CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
//     //print(cmRespDto.code);
//     //print(cmRespDto.msg);
//     //print(cmRespDto.data.runtimeType);
//
//     if(cmRespDto.code == 1){
//       List<dynamic> temp = cmRespDto.data;
//       List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
//       return posts;
//     } else {
//       return <Post>[]; // 빈배열 호출
//     }
//   }//까지가 구직게시판 불러오기
//
//   Future<List<Post>> findAllfreenotice()async{
//     Response response = await _postProvider.findAllfreenotice();
//     dynamic body = response.body;
//     print(convertUtf8ToObject(body));     // 응답되는 값 안깨지는지 확인
//     dynamic convertBody = convertUtf8ToObject(body); // utf-8 한글 깨짐 해결
//     CMRespDto cmRespDto = CMRespDto.fromJson(convertBody);
//     //print(cmRespDto.code);
//     //print(cmRespDto.msg);
//     //print(cmRespDto.data.runtimeType);
//
//     if(cmRespDto.code == 1){
//       List<dynamic> temp = cmRespDto.data;
//       List<Post> posts = temp.map((post) => Post.fromJson(post)).toList();
//       return posts;
//     } else {
//       return <Post>[]; // 빈배열 호출
//     }
//   }//까지가 자유게시판 불러오기
//
//
// }
