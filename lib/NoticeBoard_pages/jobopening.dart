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
            title: Text("제목1234"),
            subtitle: Text("0000년00월00일"),
            leading: Text("id"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}