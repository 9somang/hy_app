import 'package:get/get.dart';
import 'package:new_project/domain/user/user_repository.dart';
import 'package:new_project/utill/flutterToken.dart';
import 'package:new_project/utill/jwt.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();

  Future<String> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
    if (token != "-1") {
      jwtToken = token;
      print("JwtToken: $jwtToken");
    }
    return token;
  }



  Future<void> register(String username, String password, String email) async {
    _userRepository.register(username, password, email);
  }
}