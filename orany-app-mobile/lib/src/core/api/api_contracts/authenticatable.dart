import 'dart:async';

import 'package:orany_app/src/core/models/user.dart';

class Authenticatable {
  // ignore: missing_return
  Future<User> registerService(String name, String email, String password,
      String confirmPassword, String role, String photo) {}
  // ignore: missing_return
  Future<User> loginService(String email, String password) {}
  // ignore: missing_return
  Future<String> forgetPasswordService(String email) {}

  // ignore: missing_return
  Future<String> verifyPasswordResetCodeService(String userId, int resetCode) {}
  // ignore: missing_return
  Future<User> resetPassword(
      String userId, String password, String passwordConfirm) {}
}
