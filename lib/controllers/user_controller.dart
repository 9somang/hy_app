
import 'package:get/get.dart';
import 'package:new_project/domain/user/user_repository.dart';
import 'package:new_project/utill/jwt.dart';

import '../domain/user/user.dart';

class UserController extends GetxController {
  final UserRepository _userRepository = UserRepository();
  final RxBool isLogin = false.obs; // UI가 관찰가능한 변수 => 변경 => UI가 자동업데이트
  final principal = User().obs;

  Future<void> register(String username, String password, String email  ) async {
    _userRepository.register(username, password, email);
  }


  Future<int> login(String username, String password) async {
    User principal = await _userRepository.login(username, password);

    if (principal.id != null) {
      this.isLogin.value = true;
      this.principal.value = principal;
      return 1;
    } else {
      return -1;
    }
  }

  void logout() {
    this.isLogin.value = false;
    jwtToken = null;
  }
}
