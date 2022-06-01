import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/user_controller.dart';
import 'package:new_project/domain/user/user_repository.dart';
import 'package:new_project/utill/jwt.dart';
import 'package:new_project/utill/validator_util.dart';
import '../../../Main/mainpage.dart';
import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import 'Join_page.dart';

class LoginPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final UserController u = Get.put(UserController());

  final _username = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Container(),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Container(
              height: 90,
              width: 50,
              margin: EdgeInsets.all(1),
              padding: EdgeInsets.fromLTRB(0, 15, 100,100),
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('assets/image/시그니처_가로_배경제거.png'),
                  fit: BoxFit.contain
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 170,
              height: 100,
              child: Text(
                "로그인",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),

              ),
            ),
            _loginForm()

          ],
        ),
      ),
    );
  }

  Widget _loginForm() {
    // 항상 return 타입은 최상위보호타입으로 잡아주는게좋음(widget)
    return Form(
      // 나중에 DB 서버에 한번에 날려야 하기 때문에 form안에 한꺼번에 감쌈
      key: _formkey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _username,
            hint: "Username",
            funValidator: validateUsername(),
          ),
          CustomTextFormField(
            controller: _password,
            hint: "Password",
            funValidator: validatePassword(),
          ),
          CustomElevatedButton(
            text: "로그인",
            funpageRoute: () async{
              if (_formkey.currentState!.validate()) {
                int result =
                    await u.login(_username.text.trim(), _password.text.trim());
                print(result);
                if (result == 1) {
                  Get.offAll(MainPage());
                }else {showToastlogin('로그인 실패,\n 다시 시도해주세요');}
              }
            },
          ),
          TextButton(
            onPressed: () {
              Get.to(JoinPage());
            },
            child: Text(
              "아직 회원가입이 안되어있나요?",
              textAlign: TextAlign.center,

            ),
            style: TextButton.styleFrom(
              primary: Colors.indigo
          ),
          ),
        ],
      ),
    );
  }

  void showToastlogin(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.indigo,
        textColor: Colors.white,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM
    );
  }
}
