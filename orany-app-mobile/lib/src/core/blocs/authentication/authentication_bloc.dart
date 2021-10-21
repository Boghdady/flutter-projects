import 'package:orany_app/src/core/api/authentication_service.dart';
import 'package:orany_app/src/core/bloc_helpers/bloc_event_state.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/core/utils/exceptions.dart';
import 'package:orany_app/src/core/utils/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';

///
/// This BLoC is responsible for the handling the authentication process based on events
///
class AuthenticationBloc
    extends BlocEventStateBase<AuthenticationEvent, AuthenticationState> {
  AuthenticationService authService = AuthenticationService();
  AuthenticationBloc()
      : super(
          initialState: AuthenticationState.notAuthenticated(globals.userToken),
        );

  @override
  Stream<AuthenticationState> eventHandler(
      AuthenticationEvent event, AuthenticationState currentState) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ///
    /// 1) Registration Process
    ///
    if (event is AuthenticationEventRegister) {
      // Inform that we are proceeding with the authentication
      yield AuthenticationState.authenticating();

      // Call to the Registration process server
      try {
        var user = await authService.registerService(event.name, event.email,
            event.password, event.passwordConfirm, event.role, event.photo);
        if (user != null) {
          yield AuthenticationState.authenticated(user: user);
        }
      } on BadRequestException catch (e) {
        yield AuthenticationState.failure('This email is already exist');
      } catch (ex) {
        print('Exception: ${ex.toString()}');
        yield AuthenticationState.failure(ex.toString());
      }
    }

    ///
    ///  2) Login Process
    ///
    if (event is AuthenticationEventLogin) {
      // Inform that we are proceeding with the authentication
      yield AuthenticationState.authenticating();

      // Call to the Registration process server
      try {
        var user = await authService.loginService(event.email, event.password);
        if (user != null) {
          yield AuthenticationState.authenticated(user: user);
        }
      } on BadRequestException catch (e) {
        yield AuthenticationState.failure('Email or password is incorrect!');
      } on UnauthorizedException catch (e) {
        yield AuthenticationState.failure('Email or password is incorrect!');
      } catch (ex) {
        print('Exception: ${ex.toString()}');
        yield AuthenticationState.failure(ex.toString());
      }
    }

    ///
    ///  3) Logout Process
    ///
    if (event is AuthenticationEventLogout) {
      // remove token from shared_preferences here and reassign it to global variable
      prefs.remove("token");
      yield AuthenticationState.notAuthenticated('');
    }

    ///
    /// 4) Forgot password process
    ///
    if (event is AuthenticationEventForgotPassword) {
      yield AuthenticationState.authenticating();
      // Call to the ForgetPassword service
      try {
        String userId = await authService.forgetPasswordService(event.email);
        print('-------------------------------- UserID: $userId');
        if (userId != null || userId.isNotEmpty) {
          yield AuthenticationState.authenticated(
              user: null, userId: userId, userEmail: event.email);
        }
      } on UnauthorizedException catch (e) {
        yield AuthenticationState.failure('There is no user for this email!');
      } catch (ex) {
        print('Exception: ${ex.toString()}');
        yield AuthenticationState.failure(ex.toString());
      }
    }

    ///
    ///  5) Verify Password ResetCode
    ///
    if (event is AuthenticationEventVerifyPasswordResetCode) {
      yield AuthenticationState.authenticating();
      // Call to the ForgetPassword service
      try {
        String userId = await authService.verifyPasswordResetCodeService(
            event.userId, event.passwordResetCode);
        print('-------------------------------- UserID: $userId');
        if (userId != null || userId.isNotEmpty) {
          yield AuthenticationState.authenticated(user: null, userId: userId);
        }
      } on UnauthorizedException catch (e) {
        yield AuthenticationState.failure(
            'Code is expired,please generate another one!');
      } on BadRequestException catch (e) {
        yield AuthenticationState.failure('Wrong reset code!');
      } catch (ex) {
        print('Exception: ${ex.toString()}');
        yield AuthenticationState.failure(ex.toString());
      }
    }

    ///
    ///  6) Reset Password
    ///
    if (event is AuthenticationEventResetPassword) {
      yield AuthenticationState.authenticating();
      // Call to the ForgetPassword service
      try {
        User user = await authService.resetPassword(
            event.userId, event.password, event.passwordConfirm);
        print('-------------------------------- User: $user');
        if (user != null) {
          yield AuthenticationState.authenticated(user: user);
        }
      } catch (ex) {
        print('Exception: ${ex.toString()}');
        yield AuthenticationState.failure(ex.toString());
      }
    }
  }
}
