import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileUpload extends StatefulWidget {
  FileUpload({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _FileUploadState createState() => _FileUploadState();
}

class _FileUploadState extends State<FileUpload> {
  final List<PlatformFile> _files = [];

  void _pickFiles() async {
    List<PlatformFile>? uploadedFiles = (await FilePicker.platform.pickFiles(
      allowMultiple: true,
    ))
        ?.files;
    setState(() {
      for (PlatformFile file in uploadedFiles!) {
        _files.add(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _pickFiles,
                child: Text("파일 선택"),
              ),
              // Elevated Button
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/image/시그니처(세로).jpg'),
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
                          BlendMode.dstATop)),
                  border: Border.all(
                    width: 0.5,
                  ),
                ),
                width: 350,
                height: 500,

                //오버플로우로 인한 뷰에러 방지 !!!!
                child: Scrollbar(
                  isAlwaysShown: true,
                  child: ListView.builder(
                    itemCount: _files.isEmpty ? 1 : _files.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _files.isEmpty

                          //업로드한 파일 출력 리스트타일
                          ? const ListTile(
                              title: Text(
                                  "파일을 업로드해주세요! - (한 번에 여러 파일을 업로드할 수 있습니다)"))
                          : ListTile(
                              title: Text(_files.elementAt(index).name),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    _files.removeAt(index);
                                  });
                                },
                              ),
                            );
                    },
                  ),
                ),
              ),
// Elevated Button

              // 파일 업로드 버튼
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  // 나중에 파일 업로드 요청 보내는 자리
                  // 업로드한 파일 writepage에 출력하기
                },
                child: Text("파일 업로드"),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
