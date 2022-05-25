
import 'package:intl/intl.dart';

import '../user/user.dart';

class Post{
  final String? title;
  final String? content;
  final User? user;
  DateTime? created;
  DateTime? updated;

  Post(
      {
        this.title,
        this.content,
        this.created,
        this.updated,
        this.user
      });


  Post.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        content = json['content'],
        user = User.fromJson(json["user"]),
        created = DateFormat("yyyy-mm-dd").parse(json['created']),
        updated = DateFormat("yyyy-mm-dd").parse(json['updated']);

}

