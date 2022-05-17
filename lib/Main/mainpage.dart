import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/NoticeBoard_pages/freenotice.dart';
import 'package:new_project/view/pages/user/question.dart';
import '../NoticeBoard_pages/employment request.dart';
import '../NoticeBoard_pages/jobhunting.dart';
import '../NoticeBoard_pages/jobopening.dart';
import '../view/pages/user/Join_page.dart';
import '../view/pages/user/login_page.dart';
import '../view/pages/user/userinfo.dart';
import '';


class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
      label: '취업의뢰서',
      icon: Icon(Icons.poll)
    ),
    BottomNavigationBarItem(
        label: '구인게시판',
        icon: Icon(Icons.person_add_alt_1)
    ),
    BottomNavigationBarItem(
        label: '구직게시판',
        icon: Icon(Icons.emoji_people),
    ),
    BottomNavigationBarItem(
        label: '자유게시판',
        icon: Icon(Icons.apps_outlined)
    ),
  ];

  List pages = [
    Employmentrequest(),
    JobHunting(),
    JobOpening(),
    FreeNotice()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('한양공고 취업게시판',style: TextStyle(fontFamily: 'GowunDodum'),),
          backgroundColor: Colors.indigo,
          centerTitle: true,
          elevation: 0.0,
    ),
      drawer: Drawer(
        child:  ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(

            ),
            ListTile(
              leading: Icon(Icons.assignment_ind,
                  color: Colors.grey[900]
              ),
              title: Text('로그아웃'),
              onTap: (){
                  Get.to(LoginPage());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person,
                  color: Colors.grey[900]
              ),
              title: Text('회원정보보기'),
              onTap: (){
                Get.to(UserInfo());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.question_answer,
                  color: Colors.grey[900]
              ),
              title: Text('자주 묻는 질문'),
              onTap: (){
                Get.to(Questions());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // bar의 배경색
        selectedItemColor: Colors.black,
        // 선택된 카테고리의 색상
        unselectedItemColor: Colors.grey.withOpacity(.60),
        // 선택 안된 카테고리의 색상
        selectedFontSize: 14,
        //선택된 카테고리의 폰트사이즈
        unselectedFontSize: 10,
        // 선택안된 카테고리의 폰트사이즈
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: bottomItems,
      ),
      body: pages[_selectedIndex],
    );
  }
}