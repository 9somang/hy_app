import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/utill/validator_util.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/custom_text_form_field.dart';
import '../../components/customtextarea.dart';



class UpdatePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                    value: "제목1~"*2,
                ),
                CustomTextFormArea(
                    hint: "내용",
                    funValidator: validateContent(),
                    value: "내용1~"*20,
                ),

                CustomElevatedButton(
                  text: "글 수정하기",
                  funpageRoute: () {
                    if( _formkey.currentState!.validate()) {
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