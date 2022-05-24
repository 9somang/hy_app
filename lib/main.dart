import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/landingpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'GowunDodum'),
      home: LandingPage(),
    );
  }
}