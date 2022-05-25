import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://192.168.0.5/8080";

// 통신
class JobopProvider extends GetConnect {

  Future<Response> findAllJobopening() =>
      get("$host/post_jobopening", headers: {"authorization" : jwtToken ?? ""});
}