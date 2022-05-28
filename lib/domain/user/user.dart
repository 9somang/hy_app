
import 'package:intl/intl.dart';

class User{
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  DateTime? created;
  DateTime? updated;

  User(
      {
      this.id,
      this.username,
      this.password,
      this.email,
      this.created,
      this.updated
      });


    User.fromJson(Map<String, dynamic>json)  //외부에서온 데이터를 다트오브젝트로변경
    : id = json['id'],
      username = json['username'],
      password = json['password'],
      email = json['email'],
      created = DateFormat("yyyy-mm-dd").parse(json['created']),
      updated = DateFormat("yyyy-mm-dd").parse(json['updated']);

}
