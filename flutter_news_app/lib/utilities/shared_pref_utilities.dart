import 'package:shared_preferences/shared_preferences.dart';

Future<bool> isLogged() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isLogged = sharedPreferences.getBool('isLogged');

  if (isLogged == null || isLogged == false) {
    return false;
  }
  return true;
}
