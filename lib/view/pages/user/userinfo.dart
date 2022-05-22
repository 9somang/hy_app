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
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("회원 번호 : _userid",
                style: TextStyle(
                  fontSize: 20
                ),
                ),
                Text("회원 이름 : _username",
                    style: TextStyle(
                        fontSize: 20
                ),
                ),
                Text("회원 이메일 : _userpassword",
                  style: TextStyle(
                      fontSize: 20
                ),
                ),
                Text("회원가입 날짜 : _value.created",
                    style: TextStyle(
                        fontSize: 20
                ),
                ),
              ]
                ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/시그니처(세로).jpg'),
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2), BlendMode.dstATop)),
          )
        ),
    );
  }
}
