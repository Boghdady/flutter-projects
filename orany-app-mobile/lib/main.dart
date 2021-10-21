import 'package:flutter/material.dart';
import 'package:orany_app/src/app.dart';
import 'package:orany_app/src/core/utils/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // get toke from shared_preferences
//  UserService userService = UserService();
//  userService.getAllUsersService(1);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  globals.userToken = prefs.getString('token');
  runApp(App());
}
