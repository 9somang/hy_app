import 'package:get/get.dart';
import 'package:new_project/utill/Token.dart';

const host = "http://192.168.0.5:8080";

//통신
class PostProvider extends GetConnect {
  // promise (데이터약속)
  Future<Response> findAll(Map data) =>
      get("$host/post", headers: {"Authorization": Token ?? ""});
}