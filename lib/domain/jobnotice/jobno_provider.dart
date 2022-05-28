import 'package:get/get.dart';
import 'package:new_project/utill/jwt.dart';

const host = "http://10.0.2.2:5000/post";

// 통신
class JobnoProvider extends GetConnect {

  Future<Response> findAllJobNotice() =>
      get("$host/jobnotice/", headers: {"authorization" : jwtToken ?? ""});

<<<<<<< Updated upstream
  Future<Response> findByJobnoId(int id) =>
      get("$host/$id", headers: {"authorization" : jwtToken ?? ""});
=======
  Future<Response> findById(int id) =>
      get("$host/jobnotice/$id", headers: {"authorization" : jwtToken ?? ""});
>>>>>>> Stashed changes


}