import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/landingpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:new_project/controller_bindings.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: ControllerBindings(),
      theme: ThemeData(fontFamily: 'GowunDodum'),
      home: LandingPage(),
    );
  }
}