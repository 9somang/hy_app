
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';


// 1개의 파일 업로드
Future<void> uploadFile() async {
  // file picker를 통해 파일 선택
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    final filePath = result.files.single.path;

    // 파일 경로를 통해 formData 생성
    var dio = Dio();
    var formData = FormData.fromMap({
      'file' : await MultipartFile.fromFile(filePath!)
    });

    // 업로드 요청
    final response = await dio.post('/upload', data: formData);

  } else {
    // 아무런 파일도 선택되지 않음.
  }
}


// 서버에 보내는 메서드 ( from-data형식)
// postFile(List<File> files) async {
//  final url = 'API';
//
//  FormData formData = FormData.fromMap({
//    "attachments": files,
//  });
//
//  var dio = new Dio();
//
//  try {
//    var response = await dio.post(
//      url,
//      data: formData,
//    );
//
//    print("응답" + response.data.toString());
//  } catch (123) {
//    print("123.response");
//    print("123.message");
//    print("error occur");
//  }
// }