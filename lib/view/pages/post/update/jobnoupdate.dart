import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/controllers/jobnotice_controller.dart';
import 'package:new_project/utill/validator_util.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/customtextarea.dart';



class JobnoUpdatePage extends StatelessWidget {


  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final JobnoController jn = Get.find();
    _title.text= "${jn.post.value.title}";
    _content.text= "${jn.post.value.content}";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0.0,
        title: Text("취업게시판 글 수정하기"),
        centerTitle: true,
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
                    funValidator: validateTitle(),
                ),
                CustomTextFormArea(
                    controller: _content,
                    hint: "내용",
                    funValidator: validateContent(),
                ),

                CustomElevatedButton(
                  text: "글 수정하기",
                  funpageRoute: () async{
                    if( _formkey.currentState!.validate())
                      await jn.Jobnoupdate(
                          jn.post.value.id ?? 0, _title.text, _content.text);
                      // 같은 page가 있으면 이동할때 덮어씌우기 < 이게 레알 최고ㅁㄴ
                      Get.back(); //상태관리 Getx 라이브러리 - obs(데이터갱신)
                    }
                ),
              ],
            )
        ),
      ),
    );
  }
}