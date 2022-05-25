import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://192.168.0.5/8080";

// 통신
class freeProvider extends GetConnect {

  Future<Response> findAllfreenotice() =>
      get("$host/post_freenotice", headers: {"authorization" : jwtToken ?? ""});

}