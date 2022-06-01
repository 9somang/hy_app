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
            Text(
              "한양공업고등학교\n게시판 앱 간단 사용법",
              style: TextStyle(fontSize: 23),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Text(
              "본 게시판앱은 각각 취업게시판, 구인게시판, 구직게시판으로 \n 분류되어 있습니다.\n 취업게시판은 취업과 관련된 정보들을 공유하는곳이며,\n 구인게시판은 일 할 사람을 구하는 구인과 관련된 정보를 공유하는 곳이고, \n 구직게시판은 직장을 구하는 구직과 관련된 정보들을 공유하는 곳입니다. \n 글을 쓰고 나면 자신의 글을 수정이나 삭제할 수 있으며,\n 글 목록에서 화면을 위에서 아래쪽으로 당기시면 글 새로고침이 가능합니다.",
              style: TextStyle(
                  fontSize: 13,
                  height: 1.6
              ),
              textAlign: TextAlign.center,

            ),
            SizedBox(height: 5),
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
              "이 앱의 저작권은 한양공업고등학교에 있습니다.",
              style: TextStyle(fontSize: 11),
            ),
            SizedBox(height: 30),
            Text(
              "앱 개발",
              style: TextStyle(fontSize: 20),
            ),

            SizedBox(
            child:
                Text(
                  "프론트엔드 개발자 : 구소망"
                  "\n백엔드 개발자 : 송민섭",
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
