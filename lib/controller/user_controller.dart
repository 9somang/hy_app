
import 'package:get/get.dart';
import 'package:new_project/domain/user/user_reopsitory.dart';

class UserController extends GetxController {

  final UserRepository _userRepository = UserRepository();

  Future<void> login(String username, String password) async {
    String token = await _userRepository.login(username, password);
  }
}