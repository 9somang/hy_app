// import 'package:http/http.dart' as http;
// import 'package:new_project/Models/user.dart';
// import '';
//
// void _userRequest(String stockCode) async {
//   final response = await http.post(
//       Uri.http('192.168.0.5/8080', 'join'),
//       body: <String, String>{
//       '${Usermodels}' : value,
//       },
//   );
//   print('response Body : ' + response.body);
//

//   if (statusCode == 201 || statusCode == 200) {
//     print("서버 통신양호 : " + getJson.fromJson(jsonDecode(response.body)).value);
//   } else if (statusCode == 504) {
//     showToast("서버와의 연결이 불안정 합니다.");
//   } else {
//     showToast("종목코드가 올바르지 않습니다.");
//     throw Exception('Failed to contect Server.');
//   }
// }
