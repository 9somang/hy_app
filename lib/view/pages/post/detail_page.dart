import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/view/pages/post/comment_page.dart';
import 'package:new_project/view/pages/post/update_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:new_project/view/pages/post/write_page.dart';

class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    //메타코딩 11강..5분쯤
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          title: Text("글 상세 페이지"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("글 제목",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
              ),       //오른쪽 정렬로다가 날짜 및 아이디 가능하면 좋겟당
              Divider(),
              Container(
                child: Text("yyyy-mm-dd"),
              ),
              Container(
                child: Text("작성자 : _username"),
              ),
              Divider(),
              Row(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        // Get.to(cmtpages());
                      },
                      child: Text("댓글")
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        _deleteDialog(context); // 상태관리로 갱신 시킬 수 있음.
                      },
                      child: Text("삭제")
                  ),
                  SizedBox(width: 7),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Get.to(UpdatePage());
                      },
                      child: Text("수정")
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      border:   Border.all(),
                      borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                      ),
                    ),
                    child: Text("업로드된 파일", // 추후에버튼으로 수정
                      style: TextStyle(
                        height: 1.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                      width: 160,
                      height: 30,
                    ),
                ],
              ),
              SizedBox(height:10),
              Expanded(
                  child: SingleChildScrollView(
                    child: Text("글의 내용 " * 500),
                  )
              ),
            ],
          ),
        )
    );
  }
}


void _deleteDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("정말로 게시물을 삭제하시겠습니까?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: <Widget>[
                  Text('게시물을 삭제하면 되돌릴 수 없습니다.')
                ]
            ),
          ),
          actions: [
            FlatButton(
              child: Text("예"),
              onPressed: () {
                Navigator.of(context).pop(); // 저장소에서 해당 게시물삭제
                _deleteDialog(context);
                Get.to(MainPage());
              },
            ),
            FlatButton(
              child: Text("아니요"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
