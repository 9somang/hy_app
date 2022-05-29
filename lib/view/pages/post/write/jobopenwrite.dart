import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project/Main/mainpage.dart';
import 'package:new_project/uploader/file.dart';
import 'package:new_project/uploader/filepickertest.dart';
import 'package:new_project/utill/validator_util.dart';
import '../../../../controllers/jobopen_controller.dart';
import '../../../components/custom_elevated_button.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../components/customtextarea.dart';

class JobopenWritePage extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();
  final _title = TextEditingController();
  final _content = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: ListView(
            children: [
              TextButton(
                  onPressed: (){
                      Get.to(FileUpload(title: '파일 업로드 페이지',));
                  },
                  child: Text("파일 업로드")
              ),
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
                funpageRoute: () async {
                  if( _formkey.currentState!.validate()) {
                    await Get.find<JobopenController>()
                        .Jobopensave(_title.text, _content.text);
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