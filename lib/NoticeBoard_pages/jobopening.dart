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
        centerTitle: true,
        title: Text("구인"),
        leading: Container(),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: (){
              Get.to(WritePage());
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.separated(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index), arguments: "arguments 속성 테스트");
            },
            title: Text("제목1"),
            leading: Text("1"),
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}