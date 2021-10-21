import 'package:orany_app/src/core/bloc_helpers/bloc_event_state.dart';

abstract class AuthenticationEvent extends BlocEvent {
  final String token;

  AuthenticationEvent({
    this.token: '',
  });
}

///
/// 1) First Event ==> login: this event is emitted when the user correctly authenticates login
///
class AuthenticationEventLogin extends AuthenticationEvent {
  final String email;
  final String password;
  AuthenticationEventLogin({
    this.email,
    this.password,
    String token,
  }) : super(
          token: token,
        );
}

///
/// 2) First Event ==> login: this event is emitted when the user correctly authenticates register
///
class AuthenticationEventRegister extends AuthenticationEvent {
  final String name;
  final String email;
  final String photo;
  final String password;
  final String passwordConfirm;
  final String role;
  AuthenticationEventRegister({
    this.name,
    this.email,
    this.photo,
    this.password,
    this.passwordConfirm,
    this.role,
    String token,
  }) : super(
          token: token,
        );
}

///
/// 3) Third Event ==> logout: the event is emitted when the user logs out.
///
class AuthenticationEventLogout extends AuthenticationEvent {}

///
/// 4) Fourth Event ==> login: this event is emitted when the user correctly authenticates Forgot Password
///
class AuthenticationEventForgotPassword extends AuthenticationEvent {
  final String email;
  AuthenticationEventForgotPassword({
    this.email,
    String token,
  }) : super(token: token);
}

///
/// 5) Fiveth Event ==> login: this event is emitted when the user correctly authenticates VerifyPasswordResetCode
///
class AuthenticationEventVerifyPasswordResetCode extends AuthenticationEvent {
  final String userId;
  final int passwordResetCode;

  AuthenticationEventVerifyPasswordResetCode(
      {this.userId, this.passwordResetCode, String token})
      : super(token: token);
}

///
/// 6) Fiveth Event ==> resetPassword: this event is emitted when the user correctly authenticates resetPassword
///
class AuthenticationEventResetPassword extends AuthenticationEvent {
  final String userId;
  final String password;
  final String passwordConfirm;

  AuthenticationEventResetPassword(
      {this.userId, this.password, this.passwordConfirm, String token})
      : super(token: token);
}
