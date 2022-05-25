import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://192.168.0.5/8080";

// 통신
class JobnoProvider extends GetConnect {

  Future<Response> findAllJobNotice() =>
      get("$host/post_jobnotice", headers: {"authorization" : jwtToken ?? ""});

}