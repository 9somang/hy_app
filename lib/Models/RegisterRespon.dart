class RegistrationApiResponse {
  RegistrationApiResponse({
    required this.status,
    required this.message,
    required this.userData,
  });

  String status;
  String message;
  //UserData userData;
  UserData? userData;

  factory RegistrationApiResponse.fromJson(Map<String, dynamic> json) => RegistrationApiResponse(
  status: json["Status"],
  message: json["Message"],
  userData: json["UserData"] == null? null:UserData.fromJson(json["UserData"] as Map<String, dynamic>),
  );

}


class UserData {
  UserData({
    required this.name,
    required this.id,
  });

  String name;
  String id;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    name: json["username"],
    id: json["userid"],
  );

}
