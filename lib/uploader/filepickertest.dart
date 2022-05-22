
import 'dart:html';
import 'package:dio/dio.dart';




postFile(List<File> files) async {
  final url = 'YOUR_API';

  FormData formData = FormData.fromMap({
    "attachments": files,
  });

  var dio = new Dio();

  try {
    var response = await dio.post(
      url,
      data: formData,
    );

    print("응답" + response.data.toString());
  } catch (eee) {
    print("error occur");
  }
}