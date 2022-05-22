import 'package:get/get_connect/http/src/response/response.dart';
import 'package:new_project/controller/dto/LoginReqDto.dart';
import 'package:new_project/domain/user/user_provider.dart';

// 통신을 호출해서 응답되는 데이터를 예쁘게 가공 => json => dart 오브젝트
class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<String> login(String username, String password) async {
    LoginReqDto loginReqDto = LoginReqDto(username, password);
    print(loginReqDto.toJson());
    Response response = await _userProvider.login(loginReqDto.toJson());
    dynamic headers = response.headers;
    if (headers["authorization"] == null) {
      return "-1";
    } else {
      String token = headers["authorization"];
      return token;
    }
  }
}