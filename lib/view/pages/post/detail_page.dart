import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/view/pages/post/update_page.dart';
import 'package:file_picker/file_picker.dart';

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
          title: Text("상세 페이지"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("글제목",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)
              ),
              Container(
                child: Text("업로드된 파일: "),
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
                        // Get.to(CommentPage());
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
                        Get.off(MainPage()); // 상태관리로 갱신 시킬 수 있음.
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
                    child: Text("작성자 : $id",
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
                    child: Text("글 내용" * 500),
                  )
              ),
            ],
          ),
        )
    );
  }
}