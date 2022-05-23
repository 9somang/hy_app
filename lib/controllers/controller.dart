import 'dart:convert';
import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_project/Models/user.dart';

class Controller extends GetxController{

      var userjoin = <Usermodels>[].obs;
      var isLoading = true.obs;


    Future<void> fetchUserData() async{
      final response = await http.get(Uri.parse("url"));

      if(response.statusCode==200){
        Usermodels _Usermodels = Usermodels.fromJson(jsonDecode(response.body));

        userjoin.add(
          Usermodels(
            id: _Usermodels.id,
            username: _Usermodels.username ,
            password: _Usermodels.password,
            email: _Usermodels.email,
            ),
            );
      }
    }
}
