import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import 'package:new_project/controllers/jobopen_controller.dart';
import 'package:new_project/utill/validator_util.dart';
import 'package:new_project/view/pages/post/detail/jobopdetail.dart';

import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/customtextarea.dart';



class JobopenUpdatePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();


  @override
  Widget build(BuildContext context) {
    JobopenController jo = Get.find();
    _title.text= "${jo.post.value.title}";
    _content.text= "${jo.post.value.content}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("글 수정하기"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _formkey,
            child: ListView(
              children: [
                CustomTextFormField(
                  hint: "제목",
                  funValidator: validateTitle(),
                ),
                CustomTextFormArea(
                  hint: "내용",
                  funValidator: validateContent(),
                ),

                CustomElevatedButton(
                  text: "글 수정하기",
                  funpageRoute: () async{
                    if( _formkey.currentState!.validate()) {
                      await jo.Jobopenupdate(
                          jo.post.value.id ?? 0, _title.text, _content.text);
                      // 같은 page가 있으면 이동할때 덮어씌우기 < 이게 레알 최고ㅁㄴ
                      Get.back(); //상태관리 Getx 라이브러리 - obs(데이터갱신)
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