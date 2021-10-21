import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:orany_app/src/core/utils/mixins.dart';
import 'package:orany_app/src/core/utils/provider.dart';

class ResetPasswordFormBloc extends BlocBase with ValidatorMixin {
  final _passwordController = BehaviorSubject<String>();
  final _passwordConfirmController = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Function(String) get onPasswordConfirmChanged =>
      _passwordConfirmController.sink.add;

  // Retrieve data from stream
  Stream<String> get passwordStream =>
      _passwordController.stream.transform(validatePassword);

  Stream<String> get confirmPasswordStream => _passwordConfirmController.stream
          .transform(validatePassword)
          .doOnData((String c) {
        // If the password is accepted (after validation of the rules)
        // we need to ensure both password and retyped password match
        if (0 != _passwordController.value.compareTo(c)) {
          // If they do not match, add an error
          _passwordConfirmController.addError("No Match");
        }
      });

  //
  // Registration button
  Stream<bool> get resetValid => Observable.combineLatest2(
      passwordStream, confirmPasswordStream, (e, p) => true);

  @override
  void dispose() {
    _passwordController.close();
    _passwordConfirmController.close();
  }
}
