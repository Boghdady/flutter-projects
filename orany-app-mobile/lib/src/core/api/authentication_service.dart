import 'package:http/http.dart' as http;
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/core/utils/exceptions.dart';
import 'package:orany_app/src/core/utils/no_internet_connection.dart';
import 'package:orany_app/src/core/api/api_contracts/authenticatable.dart';
import 'package:orany_app/src/core/utils/shared_prefrences.dart';

import 'dart:convert' as convert;
import 'package:orany_app/src/helpers/constants.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService implements Authenticatable {
  String url;
  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, dynamic> body;

  @override
  Future<User> loginService(String email, String password) async {
    url = auth_login;
    body = new Map<String, dynamic>();
    body['email'] = email;
    body['password'] = password;
    var jsonBody = convert.jsonEncode(body);

    await checkInternetConnection();
    var response = await http.post(url, headers: headers, body: jsonBody);
    print("Request failed with status: ${response.statusCode}.");
    print("Request failed with body: ${response.body}.");
    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);
        var token = jsonResponse['token'];
        var data = jsonResponse['data'];
        var user = User.fromJson(data['user']);
        // add token to shared_preferences
        await addStringToSF('token', token);
        return user;
        break;
      case 400:
        throw BadRequestException();
        break;
      case 404:
        throw ResourceNotFoundException('Login');
        break;
      case 401:
        throw UnauthorizedException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
        break;
    }

    return null;
  }

  @override
  Future<User> registerService(String name, String email, String password,
      String passwordConfirm, String role, String photo) async {
    url = auth_signup;
    body = new Map<String, dynamic>();
    body['name'] = name;
    body['email'] = email;
    body['photo'] = photo;
    body['password'] = password;
    body['passwordConfirm'] = passwordConfirm;
    body['role'] = role;

    ///
    /// Convert body to json format
    ///
    var jsonBody = convert.jsonEncode(body);

    await checkInternetConnection();
    var response = await http.post(url, headers: headers, body: jsonBody);
    print("Request failed with status: ${response.statusCode}.");
    print("Request failed with body: ${response.body}.");
    switch (response.statusCode) {
      case 201:
        var jsonResponse = convert.jsonDecode(response.body);
        var token = jsonResponse['token'];
        // Add token to shared_preferences
        await addStringToSF('token', token);
        var data = jsonResponse['data'];
        var user = User.fromJson(data['user']);

        return user;
        break;
      case 400:
        throw BadRequestException();
        break;
      case 404:
        throw ResourceNotFoundException('Signup');
        break;
      case 401:
        throw UnauthorizedException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
        break;
    }
    return null;
  }

  @override
  Future<String> forgetPasswordService(String email) async {
    url = auth_forgot_password;
    body = new Map<String, dynamic>();
    body['email'] = email;

    ///
    /// Convert body to json format
    ///
    var jsonBody = convert.jsonEncode(body);

    await checkInternetConnection();
    var response = await http.post(url, headers: headers, body: jsonBody);
    print("Request failed with status: ${response.statusCode}.");
    print("Request failed with body: ${response.body}.");

    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);
        String userId = jsonResponse['userId'];
        return userId;
        break;
      case 400:
        throw BadRequestException();
        break;
      case 404:
        throw ResourceNotFoundException('ForgetPassword');
        break;
      case 401:
        throw UnauthorizedException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
        break;
    }
    return null;
  }

  @override
  Future<User> resetPassword(
      String userId, String password, String passwordConfirm) async {
    url = auth_reset_password;
    body = new Map<String, dynamic>();
    body['id'] = userId;
    body['password'] = password;
    body['passwordConfirm'] = passwordConfirm;

    ///
    /// Convert body to json format
    ///
    var jsonBody = convert.jsonEncode(body);

    await checkInternetConnection();
    var response = await http.post(url, headers: headers, body: jsonBody);
    print("Request failed with status: ${response.statusCode}.");
    print("Request failed with body: ${response.body}.");

    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);
        var token = jsonResponse['token'];
        print('-------- token');
        var data = jsonResponse['data'];
        var user = User.fromJson(data['user']);
        // add token to shared_preferences
        await addStringToSF('token', token);
        return user;
        break;
      case 400:
        throw BadRequestException();
        break;
      case 404:
        throw ResourceNotFoundException('ResetPasword');
        break;
      case 401:
        throw UnauthorizedException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
        break;
    }
    return null;
  }

  @override
  Future<String> verifyPasswordResetCodeService(
      String userId, int resetCode) async {
    url = auth_verify_password_reset_code;
    body = new Map<String, dynamic>();
    body['id'] = userId;
    body['resetCode'] = resetCode;

    ///
    /// Convert body to json format
    ///
    var jsonBody = convert.jsonEncode(body);

    await checkInternetConnection();
    var response = await http.post(url, headers: headers, body: jsonBody);
    print("Request failed with status: ${response.statusCode}.");
    print("Request failed with body: ${response.body}.");

    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);
        String userId = jsonResponse['userId'];
        return userId;
        break;
      case 400:
        throw BadRequestException();
        break;
      case 404:
        throw ResourceNotFoundException('VerifyResetPasswordCode');
        break;
      case 401:
        throw UnauthorizedException();
        break;
      case 301:
      case 302:
      case 303:
        throw RedirectionFoundException();
        break;
    }
    return null;
  }
}
