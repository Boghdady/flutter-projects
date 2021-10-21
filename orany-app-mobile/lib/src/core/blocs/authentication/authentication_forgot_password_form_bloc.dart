import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:orany_app/src/core/utils/mixins.dart';
import 'package:orany_app/src/core/utils/provider.dart';

class ForgotPasswordFormBloc extends BlocBase with ValidatorMixin {
  final _emailController = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get onEmailChanged => _emailController.sink.add;

  // Retrieve data from stream
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);

  // Submit button
//  Stream<bool> get registerValid => Observable.combine(
//      emailStream, (e) => true);

  @override
  void dispose() {
    _emailController.close();
  }
}
