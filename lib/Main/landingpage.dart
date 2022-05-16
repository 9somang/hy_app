import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'dart:async';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/view/pages/user/login_page.dart';

class LandingPage extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),(){
      Get.offAll(LoginPage());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/image/시그니처(세로).jpg',fit: BoxFit.contain)

        ),
        CircularProgressIndicator()
      ],
    )

    );
  }
}

