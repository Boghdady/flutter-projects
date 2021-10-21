import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:orany_app/src/core/api/authentication_service.dart';
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/core/utils/mixins.dart';
import 'package:orany_app/src/core/utils/provider.dart';

class LoginFormBloc extends BlocBase with ValidatorMixin {
  AuthenticationService _authenticationService = AuthenticationService();

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _loginController = BehaviorSubject<User>();

  // Add data to stream
  StreamSink<String> get emailSink => _emailController.sink;
  StreamSink<String> get passwordSink => _passwordController.sink;
  StreamSink<User> get loginSink => _loginController.sink;

  // Retrieve data from stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);
  Stream<User> get loginStream => _loginController.stream;

  Stream<bool> get validToLogin =>
      Observable.combineLatest2(emailStream, passwordStream, (e, p) => true);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _loginController.close();
  }
}
