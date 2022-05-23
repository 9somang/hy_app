
class Usermodels {
  final int userid;
  final String username;
  final String password;
  final String? email;

  Usermodels(
      {required this.userid,
      required this.username,
      required this.password,
      this.email});

  factory Usermodels.fromJson(Map<String, dynamic> json) {
    return Usermodels(
        userid: json['userid'],
        username: json['username'],
        password: json['password'],
        email: json['email']
    );
  }
}
