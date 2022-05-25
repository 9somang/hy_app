import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/freenotice_controller.dart';
import '../view/pages/post/detail_page.dart';
import '../view/pages/post/write_page.dart';

class FreeNotice extends StatefulWidget {
  @override
  _FreeNoticeState createState() => _FreeNoticeState();
}

class _FreeNoticeState extends State<FreeNotice> {
  @override
  Widget build(BuildContext context) {
    FreenoticeController f = Get.put(FreenoticeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("자유 게시판",
          style: TextStyle(
              fontSize: 20,
              color: Colors.indigo
          ),
        ),
        leading: Container(),
        elevation: 2,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Get.to(WritePage());
            },
            icon: Icon(Icons.add),
            color: Colors.indigo,
          )
        ],
      ),
      body: Obx(()=> ListView.separated(
        itemCount: f.posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index));
            },
            title: Text(
              "${f.posts[index].title}",
              style: TextStyle(fontSize: 17),
            ),
            subtitle: Text("작성자 : {_username}"
              ,style: TextStyle(fontSize: 13),
            ),
            leading: Text(
              "{yyyy_mm_dd}",
              style: TextStyle(fontSize: 8),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )),
    );
  }
}