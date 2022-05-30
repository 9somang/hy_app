class RegisterReqDto {
  final String? username;
  final String? password;
  final String? email;


  RegisterReqDto(this.username, this.password, this.email);

  Map<String, dynamic> toJson() => {
    "username" : username,
    "password" : password,
    "email" : email,
  };
}