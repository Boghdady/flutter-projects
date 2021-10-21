import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/core/utils/exceptions.dart';
import 'package:orany_app/src/core/utils/no_internet_connection.dart';
import 'package:orany_app/src/helpers/constants.dart';

class UserService {
  String url;
  Map<String, String> headers = {"Content-type": "application/json"};
  Map<String, dynamic> body;

  Future<List<User>> getAllUsersService(int page) async {
    url = get_all_users + '?page=$page&limit=15';
    await checkInternetConnection();
    var response = await http.get(url, headers: headers);
    List<User> usersList = List<User>();
    switch (response.statusCode) {
      case 200:
        var jsonResponse = convert.jsonDecode(response.body);
        var data = jsonResponse['data'];
        var usersJsonArray = data['data'];
        for (var user in usersJsonArray) {
          var userObject = User.fromJson(user);
          usersList.add(userObject);
        }
//        print(usersList.length);
        return usersList;
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
}
