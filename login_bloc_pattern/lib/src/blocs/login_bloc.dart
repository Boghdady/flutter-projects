import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:login_bloc_section14/src/mixins/validator_mixin.dart';

import 'provider.dart';

// StreamController = Subject in rxDart
// Stream = Observable in rxDart
class LoginBloc extends BlocBase with ValidatorMixin {
//  final _emailController = StreamController<String>.broadcast();
//  final _passwordController = StreamController<String>.broadcast();

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _emailCounter = BehaviorSubject<int>();

  // Add data to stream
  StreamSink<String> get changeEmail => _emailController.sink;
  Function(String) get changePassword => _passwordController.sink.add;

  // Retrieve data from stream ( will retrieve valid email or error )
  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordController.stream.transform(validatePassword);
  // take the latest values if email and password stream and return true if two streams are valid
  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (e, p) => true);
  Stream<int> get counter => _emailCounter.stream;

  void btnSubmitClick() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  LoginBloc() {
    // add email length in emailCounter stream
    _emailController.listen((email) => _emailCounter.add(email.length));
  }
  // close stream controllers after done
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _emailCounter.close();
  }
}
// make instance of bloc when i use single global instance
// final bloc = LoginBloc();
