import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://10.0.2.2:5000/post";

// 통신
class JobopProvider extends GetConnect {

  Future<Response> findAllJobopening() =>
      get("$host/jobopen/", headers: {"authorization" : jwtToken ?? ""});

  Future<Response> findByopenId(int id) =>
      get("$host/jobopen/$id", headers: {"authorization" : jwtToken ?? ""});
}