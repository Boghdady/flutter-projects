import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_news_app/utilities/api_utilities.dart';

class LoginApi {
  Future<bool> login(String email, String password) async {
    String url = base_url + login_url;

    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    Map<String, String> body = {"email": email, "password": password};

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      try {
        var jsonData = jsonDecode(response.body);
        var data = jsonData["data"];
        var token = data["token"];

        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", token);
        print(token);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}
