import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('회원 정보 보기'),
        backgroundColor: Colors.indigo,
      ),
    );
  }

}