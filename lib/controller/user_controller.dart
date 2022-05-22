
import 'package:get/get.dart';
import 'package:new_project/domain/user/user_repository.dart';
import '../utill/Token.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // ui가 관찰 가능한 변수 => 변경 => ui 자동업뎃

  void logout(){
    isLogin.value = false;
    Token = null;
  }


  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);

    if(token != "-1") {
      Token = token;
      print("Token : $Token");
    }
    return token;
  }
}