import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/pages/post/detail_page.dart';
import '../view/pages/post/write_page.dart';


class JobOpening extends StatefulWidget {
  @override
  _JobOpeningState createState() => _JobOpeningState();
}

class _JobOpeningState extends State<JobOpening> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("구인 게시판",
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
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index));
            },
            title: Text(
              "구인게시판 글 제목",
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
      ),
    );
  }
}