import 'dart:async';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/core/utils/validators/validator_email.dart';
import 'package:orany_app/src/core/utils/validators/validator_password.dart';
import 'package:rxdart/rxdart.dart';

class RegistrationFormBloc extends Object
    with EmailValidator, PasswordValidator
    implements BlocBase {
  final BehaviorSubject<String> _nameController = BehaviorSubject<String>();
  final BehaviorSubject<String> _emailController = BehaviorSubject<String>();
  final BehaviorSubject<String> _photoController = BehaviorSubject<String>();
  final BehaviorSubject<String> _roleController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordController = BehaviorSubject<String>();
  final BehaviorSubject<String> _passwordConfirmController =
      BehaviorSubject<String>();

  //
  //  Inputs
  //
  Function(String) get onNameChanged => _nameController.sink.add;
  Function(String) get onPhotoChanged => _photoController.sink.add;
  Function(String) get onRoleChanged => _roleController.sink.add;
  Function(String) get onEmailChanged => _emailController.sink.add;
  Function(String) get onPasswordChanged => _passwordController.sink.add;
  Function(String) get onRetypePasswordChanged =>
      _passwordConfirmController.sink.add;

  //
  // Validators, output
  //
  Stream<String> get nameStream => _nameController.stream;
  Stream<String> get photoStream => _photoController.stream;
  Stream<String> get roleStream => _roleController.stream;
  Stream<String> get emailStream =>
      _emailController.stream.transform(validateEmail);
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
  Stream<bool> get registerValid => Observable.combineLatest3(
      emailStream, passwordStream, confirmPasswordStream, (e, p, c) => true);

  @override
  void dispose() {
    _emailController?.close();
    _passwordController?.close();
    _passwordConfirmController?.close();
    _nameController?.close();
    _photoController?.close();
    _roleController?.close();
  }
}
