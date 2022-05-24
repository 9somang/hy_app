import 'package:get/get.dart';

const host = "http://192.168.0.5/8080";
// 통신
class UserProvider extends GetConnect {

  Future<Response> register(Map data)=> post("$host/register",data);

  Future<Response> login(Map data) => post ("$host/login",data);
}