
import '../user/user.dart';

class Post{
  final int? id;
  final String? title;
  final String? content;
  final User? user;
  final String? created;
  final String? updated;

  Post(
      {
        this.id,
        this.title,
        this.content,
        this.created,
        this.updated,
        this.user
      });


  Post.fromJson(Map<String, dynamic> json) //외부에서온 데이터를 다트오브젝트로변경
      : id = json['id'],
        title = json['title'],
        content = json['content'],
        user = User.fromJson(json["user"]),
        created = json['created'],
        updated = json['updated'];

}

