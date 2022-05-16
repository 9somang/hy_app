import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/view/pages/post/update_page.dart';


class DetailPage extends StatelessWidget {
  final int id;

  const DetailPage(this.id);

  @override
  Widget build(BuildContext context) {
      //String data = Get.arguments;
      //메타코딩 11강..5분쯤
    return Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("글제목",
              style: TextStyle(fontWeight: FontWeight.bold , fontSize: 35)
          ),
          Divider(),
          Row(
            children: [
              ElevatedButton(
                  onPressed: (){
                    Get.off(MainPage());  // 상태관리로 갱신 시킬 수 있음.
                  },
                  child: Text("삭제")
              ),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: (){
                    Get.to(UpdatePage());
                  },
                  child: Text("수정")
              ),
            ],
          ),

          Expanded(
              child: SingleChildScrollView(
                child: Text("글 내용"* 500),
              )
          ),
        ],
      ),
    )
  );
  }
}