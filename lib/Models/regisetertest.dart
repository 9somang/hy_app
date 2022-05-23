import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';


Future <void> registration(String  Username, Password, Email,repwd) async{
  var jsonResponse ;
  Map data = {

    'Username': Username,
    'Password': Password,
    'Email' : Email,
    'RetypePassword': repwd,
  };
  print(data);

  String body = json.encode(data);


  var url =
    Uri.parse('http://192.168.0.5/8080');

  var response = await http.post(
    url,
    body: body,
    headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
  );

  print(response.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body.toString());
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(SnackBar(content:Text(" ${jsonResponse['Message']}"))) ;
    print('success');
  } else {
    print('error');
  }



}