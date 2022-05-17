import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/pages/post/detail_page.dart';
import '../view/pages/post/write_page.dart';

class Employmentrequest extends StatefulWidget {
  @override
  _EmploymentrequestState createState() => _EmploymentrequestState();
}

class _EmploymentrequestState extends State<Employmentrequest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("취업의뢰서",
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