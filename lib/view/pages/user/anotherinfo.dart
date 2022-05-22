import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('기타 앱 정보'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 100, 100, 50),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/시그니처_가로_배경제거.png'),
                ),
              ),
              width: 500,
              height: 70,
            ),
            Text(
              "저작권 : 한양공업고등학교",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Text(
              "앱 개발",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 10),
            SizedBox(
            child:
                Text(
                  "프론트엔드 개발자 : 구소망"
                  "\n백엔드 개발자 : 송민섭"
                  "\n 개발 툴(IDE) : Android Studio"
                  "\n 사용한 프레임워크 : flutter, flask",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                    ),
            ),
            ),

          ],
        ),
      ),
    );
  }
}
