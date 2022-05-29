import '../../domain/user/user.dart';

class SaveReqDto {
  final String? title;
  final String? content;
  final String? username;

  SaveReqDto(this.title, this.content,this.username);

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "username": username
      };
}
