import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import 'package:new_project/controllers/user_controller.dart';
import 'package:new_project/view/pages/post/update/jobnoupdate.dart';
import 'package:file_picker/file_picker.dart';
import 'package:new_project/view/pages/post/write/jobopenwrite.dart';

class jobnoDetailPage extends StatelessWidget {
  final int? id;

  const jobnoDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    //String data = Get.arguments;
    UserController u = Get.find();
    JobnoController  jn = Get.find();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0.0,
          title: Text("글 상세 페이지"),
          centerTitle: true,
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(()=> Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${jn.post.value.title}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)
              ),       //오른쪽 정렬로다가 날짜 및 아이디 가능하면 좋겟당
              Divider(),
              Container(
                child: Text("작성일 : ${jn.post.value.created}"),
              ),
              Container(
                child: Text("작성자 : ${jn.post.value.user?.username}"),
              ),
              SizedBox(height: 5),
              u.principal.value.id == jn.post.value.user!.id ? Row(
                children: [
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
                        Get.to(()=> JobnoUpdatePage());
                      },
                      child: Text("수정")
                  ),
                  SizedBox(width: 10),
                ],
              ) : SizedBox(),
              Container(    // row 바깥으로 업로드파일확인버튼을 빼놨음
                decoration: BoxDecoration(
                  border:   Border.all(),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                width: 160,
                height: 30,
              ),
              SizedBox(height:7),
              Expanded(
                  child: SingleChildScrollView(
                    child: Text("${jn.post.value.content}"),
                  )
              ),
            ],
          ),
          ),
        )
    );
  }
}


void _deleteDialog(BuildContext context) {
  JobnoController  jn = Get.find();
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
              onPressed: () async{
                Navigator.of(context).pop(); // 저장소에서 해당 게시물삭제
                _deleteDialog(context);
                await jn.deleteByJobnoId(jn.post.value.id!);
                Get.off(()=> MainPage());
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

