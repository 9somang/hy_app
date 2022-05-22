import 'package:get/get.dart';

const host = "http://192.168.0.5:8080";

// 역할 : 통신
class UserProvider extends GetConnect {
  // future = promise (데이터 약속)
  Future<Response> login(Map data) => post("$host/", data);
}