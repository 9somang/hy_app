import 'package:http/http.dart' as http;

void _userRequest(String stockCode) async {
  final response = await http.post(Uri.http('192.168.0.5/8080',
      'join'),
      body: <String, String>{
  '${UserModels}' : userid;
  ''
