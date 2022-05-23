class Usermodels {
  final int id;
  final String username;
  final String password;
  final String? email;

  Usermodels({
    required this.id,
    required this.username,
    required this.password,
    required this.email
  });

//
  factory Usermodels.fromJson(Map<String,dynamic> json) {
    return Usermodels(
      id: json['id'],
      username: json['username'] ,
      password: json['password'],
      email: json['email']
    );
  }
}