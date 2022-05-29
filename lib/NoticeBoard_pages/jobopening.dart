import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobopen_controller.dart';
import 'package:new_project/view/pages/post/detail/jobopdetail.dart';
import '../view/pages/post/write/jobopenwrite.dart';

class JobOpening extends StatefulWidget {
  @override
  _JobOpeningState createState() => _JobOpeningState();
}

class _JobOpeningState extends State<JobOpening> {
  @override
  Widget build(BuildContext context) {
    JobopenController jopen = Get.put(JobopenController());
    jopen.findAllJobOpening();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "구인 게시판",
          style: TextStyle(fontSize: 20, color: Colors.indigo),
        ),
        leading: Container(),
        elevation: 2,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Get.to(()=> JobopenWritePage());
            },
            icon: Icon(Icons.add),
            color: Colors.indigo,
          )
        ],
      ),
      body: Obx(
        () => ListView.separated(
          itemCount: jopen.posts.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () async{
                await jopen.findByopenId(jopen.posts[index].id!);
                Get.to(jobopDetailPage(jopen.posts[index].id));
              },
              title: Text("${jopen.posts[index].title}",
                style: TextStyle(fontSize: 17),
              ),
              subtitle: Text("작성자 : ${jopen.posts[index].user?.username}",
                style: TextStyle(fontSize: 13),
              ),
              leading: Text("${jopen.posts[index].created}",
                style: TextStyle(fontSize: 8),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
