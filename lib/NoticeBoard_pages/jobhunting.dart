import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobhunt_controller.dart';
import 'package:new_project/view/pages/post/write_page.dart';

import '../controllers/post_controller.dart';
import '../view/pages/post/jobnodetail.dart';

class JobHunting extends StatefulWidget {
  @override
  _JobHuntingState createState() => _JobHuntingState();
}

class _JobHuntingState extends State<JobHunting> {
  @override
  Widget build(BuildContext context) {
    JobhuntController jhunt = Get.put(JobhuntController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("구직 게시판",
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
        itemCount: jhunt.posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Get.to(DetailPage(index));
            },
            title: Text(
              "${jhunt.posts[index].title}",
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