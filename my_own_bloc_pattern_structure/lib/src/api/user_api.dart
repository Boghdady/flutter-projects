import 'dart:convert' as convert;
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:login_bloc_section14/src/models/user.dart';

class UserApi {
  var url = "http://127.0.0.1:8000/api/v1/users/login";
  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, dynamic> body = new Map<String, dynamic>();

  Future<LoginModel> login({String email, String password}) async {
//    var url = "https://jsonplaceholder.typicode.com/users/${1}";
    body['email'] = email;
    body['password'] = password;

    var user;
    try {
      var response = await http.post(url,
          headers: headers, body: convert.jsonEncode(body));
      print("Request failed with status: ${response.statusCode}.");
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        var responseObject = LoginModel.fromJson(jsonResponse);
        print(responseObject.token);
        print(responseObject.data.user.name);
      } else {
        print("Request failed with status: ${response.statusCode}.");
        print("Request failed with status: ${response.body}.");
      }
    } catch (e) {
      throw new Error();
    }
    return user;
  }
}
