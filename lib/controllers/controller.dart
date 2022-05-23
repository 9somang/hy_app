import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Models/user.dart';

class Controller extends GetxController {

  var userjoin = <Usermodels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final response = await http.get(Uri.parse("url"));

    if (response.statusCode == 200) {
      Usermodels _Usermodels = Usermodels.fromJson(jsonDecode(response.body));

      userjoin.add(
        Usermodels(
            userid: _Usermodels.userid,
            username: _Usermodels.username,
            password: _Usermodels.password,
            email: _Usermodels.email),
      );

      isLoading.value = true;
    } else {
      Get.snackbar('Error',
          'Server responded: ${response.statusCode}:${response.reasonPhrase
              .toString()}');
    }
  }

}