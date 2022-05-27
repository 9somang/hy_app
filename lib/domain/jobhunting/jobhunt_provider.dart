import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://10.0.2.2:5000/post";

// 통신
class JobhuntProvider extends GetConnect {

  Future<Response> findAllJobhunting() =>
      get("$host/jobhunt/", headers: {"authorization" : jwtToken ?? ""});
}