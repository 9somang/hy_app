import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://192.168.0.5/8080";

// 통신
class JobhuntProvider extends GetConnect {

  Future<Response> findAllJobhunting() =>
      get("$host/post_jobhunting", headers: {"authorization" : jwtToken ?? ""});
}