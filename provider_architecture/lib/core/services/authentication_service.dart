import 'dart:async';

import 'package:provider_architecutre/core/models/user.dart';

import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  // Inject our Api
  Api _api = locator<Api>();
// ignore: close_sinks
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    // Get the user profile for id
    var fetchedUser = await _api.getUserProfile(userId);

    // Check if success
    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}
