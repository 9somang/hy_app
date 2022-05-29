import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import 'package:new_project/controllers/user_controller.dart';
import 'package:new_project/utill/validator_util.dart';

import '../../../../controllers/user_controller.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/customtextarea.dart';

class JobnoWritePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();


  @override
  Widget build(BuildContext context) {

    JobnoController jn = Get.find();
    UserController u = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('취업게시판 글쓰기',
            style: TextStyle(
              fontFamily: 'GowunDodum',
              fontSize: 20,
            )),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                CustomTextFormField(
                    controller: _title,
                    hint: "제목",
                    funValidator: validateTitle()
                ),
                CustomTextFormArea(
                    controller: _content,
                    hint: "내용",
                    funValidator: validateContent()
                ),
                CustomElevatedButton(
                  text: "글쓰기",
                  funpageRoute: () async{
                    if( _formkey.currentState!.validate()) {
                      await Get.find<JobnoController>()
                          .Jobnosave(_title.text, _content.text, "${u.principal.value.username}");
                      Get.off(()=>MainPage());
                    }
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}