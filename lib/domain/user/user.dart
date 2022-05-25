
import 'package:intl/intl.dart';

class User{
  final String? username;
  final String? password;
  final String? email;
  DateTime? created;
  DateTime? updated;

  User(
      {
      this.username,
      this.password,
      this.email,
      this.created,
      this.updated});


    User.fromJson(Map<String, dynamic> json)
    : username = json['username'],
      password = json['password'],
      email = json['email'],
      created = DateFormat("yyyy-mm-dd").parse(json['created']),
      updated = DateFormat("yyyy-mm-dd").parse(json['updated']);

}
