import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controllers/dto/LoginReqDto.dart';
import 'package:new_project/controllers/dto/RegisterReqDto.dart';
import 'package:new_project/domain/user/user_provider.dart';
import 'package:new_project/utill/jwt.dart';

// 통신을 호출해서 응답되는 데이터를 가공 json > object (tojson)

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<void> register(
      String username, String password, String email ) async {
    RegisterReqDto registerReqDto = RegisterReqDto(username, password, email);
    print(registerReqDto.toJson());
    Response response = await _userProvider.register(registerReqDto.toJson());

  }

  Future<String> login(String username, String password)async{
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;   // headers 함수 = 서버에서 보내는 응답헤더;

    if (headers["authorization"] == null) {
      return "-1";          // 헤더의 authorization 값이 널이면 통신비정상
    } else {
      String token = headers["authorization"];
      return token;               //token에 authorization에 있는 응답토큰값저장
    }
  }
}