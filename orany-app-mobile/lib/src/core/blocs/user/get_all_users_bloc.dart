import 'dart:async';

import 'package:orany_app/src/core/api/user_service.dart';
import 'package:orany_app/src/core/models/user.dart';

class GetAllUsersBloc {
  final _users = <User>[];
  final _userService = UserService();

  final StreamController<List<User>> _usersController =
      StreamController<List<User>>();

  Stream<List<User>> get usersStream => _usersController.stream;

  Future<bool> fetchUsers(int page) async {
    var usersList = await _userService.getAllUsersService(page);
    if (usersList.length != 0) {
      _users.addAll(usersList);
      _usersController.sink.add(_users);
      return true;
    }
    return false;
  }

  clearUsersList() {
    return _users.clear();
  }

  void dispose() {
    _usersController.close();
    _users.clear();
  }
}
