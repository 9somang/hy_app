// import 'package:get/get.dart';
// import 'package:new_project/utill/jwt.dart';
//
// const host = "http://192.168.0.5/8080";
//
// // 통신
// class PostProvider extends GetConnect {
//
//   Future<Response> findAllJobNotice() =>
//       get("$host/post_jobnotice", headers: {"authorization" : jwtToken ?? ""});
//
//   Future<Response> findAllfreenotice() =>
//       get("$host/post_freenotice", headers: {"authorization" : jwtToken ?? ""});
//
//   Future<Response> findAllJobhunting() =>
//       get("$host/post_jobhunding", headers: {"authorization" : jwtToken ?? ""});
//
//   Future<Response> findAllJobopening() =>
//       get("$host/post_jobopening", headers: {"authorization" : jwtToken ?? ""});
// }