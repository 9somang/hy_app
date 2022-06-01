import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/user_controller.dart';
import 'package:new_project/view/pages/user/anotherinfo.dart';
import '../NoticeBoard_pages/jobnotice.dart';
import '../NoticeBoard_pages/jobhunting.dart';
import '../NoticeBoard_pages/jobopening.dart';
import '../view/pages/user/login_page.dart';
import '../view/pages/user/userinfo.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        label: '취업게시판',
        icon: Icon(Icons.work)
    ),
    BottomNavigationBarItem(
        label: '구인게시판',
        icon: Icon(Icons.person_add_alt_1)
    ),
    BottomNavigationBarItem(
      label: '구직게시판',
      icon: Icon(Icons.emoji_people),
    ),
  ];

  List pages = [
    Jobnotice(),
    JobOpening(),
    JobHunting()
  ];

  @override
  Widget build(BuildContext context) {
    // put은 없으면 만들고, 있으면 찾는다. 이미 만들었기때문에 find.
    UserController u = Get.put(UserController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 0.0,
        title: Text('한양공업고등학교',
            style: TextStyle(
              fontFamily: 'GowunDodum',
              fontSize: 24,
            )
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/심벌마크_평면__배경제거.png'),
                  backgroundColor: Colors.white,
                ),
                accountName: Text('${u.principal.value.username}'), // 아이디 불러오기
                accountEmail: Text('${u.principal.value.email}'), // 이메일 불러오기
               decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0)
                    )
               ),

            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.grey[900]),
              title: Text('로그아웃'),
              onTap: () {
                _logoutDialog(context);
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person, color: Colors.grey[900]),
              title: Text('회원 정보 보기'),
              onTap: () {
                Navigator.pop(context);
                Get.to(()=> UserInfo());
              },
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading:
                  Icon(Icons.question_mark_rounded, color: Colors.grey[900]),
              title: Text('기타 앱 정보 및\n간단한 앱 사용법'),
              onTap: () {
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


void _logoutDialog(BuildContext context) {
  UserController u = Get.find();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("로그아웃 하시겠습니까?"),
          content: SingleChildScrollView(
            child: ListBody(
                children: <Widget>[
                  Text('로그아웃 시 로그인 화면으로 이동합니다.')
                ]
            ),
          ),
          actions: [
            FlatButton(
              child: Text("예"),
              onPressed: () {
                Navigator.of(context).pop();
                u.logout();
                Get.offAll(LoginPage());
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

