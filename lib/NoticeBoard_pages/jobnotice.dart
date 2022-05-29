import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import '../view/pages/post/detail/jobnodetail.dart';
import '../view/pages/post/write/jobnowrite.dart';

class Jobnotice extends StatefulWidget {

  @override
  _JobnoticeState createState() => _JobnoticeState();
}

class _JobnoticeState extends State<Jobnotice> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    // UserController u = Get.find();

    //객체 생성 (create),  onInit 함수실행(initialize)
    JobnoController jn = Get.put(JobnoController());
    jn.findAllJobnotice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("취업 게시판",
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
                Get.to(()=> JobnoWritePage());
              },
              icon: Icon(Icons.add),
              color: Colors.indigo,
          )
        ],
      ),
      body: Obx(
            ()=> RefreshIndicator(
              key: refreshKey,
              onRefresh: () async {
                await jn.findAllJobnotice();
              },
              child: ListView.separated(
                itemCount: jn.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () async{
                      await jn.findByJobnoId(jn.posts[index].id!);
                      Get.to(jobnoDetailPage(jn.posts[index].id));
                      },
                      title: Text("${jn.posts[index].title}",
                        style: TextStyle(fontSize: 17),
                        ),
                      subtitle: Text("작성자 : ${jn.posts[index].user?.username}"
                        ,style: TextStyle(fontSize: 13)
                        ),
                      leading: Text(
                        "${jn.posts[index].created}",
                          style: TextStyle(fontSize: 8),
                          ),
                );
              },
                separatorBuilder: (context, index) {
                  return Divider();
          },
        ),
            ),
      ),
    );
  }
}