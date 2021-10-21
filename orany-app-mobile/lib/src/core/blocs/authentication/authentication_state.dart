import 'package:orany_app/src/core/bloc_helpers/bloc_event_state.dart';
import 'package:meta/meta.dart';
import 'package:orany_app/src/core/models/user.dart';
import 'package:orany_app/src/core/utils/globals.dart' as globals;

///
/// This class will provide the information related to the authentication process.
///
class AuthenticationState extends BlocState {
  final bool isAuthenticated;
  final bool isAuthenticating;
  final bool hasFailed;
  final String errorMessage;
  final bool showDialog;
  final User user;
  final String token;
  final String userId;
  final String userEmail;

  AuthenticationState({
    @required this.isAuthenticated,
    this.isAuthenticating: false,
    this.hasFailed: false,
    this.errorMessage: '',
    this.showDialog: false,
    this.user,
    this.token: '',
    this.userId: '',
    this.userEmail: '',
  });

  factory AuthenticationState.notAuthenticated(String token) {
    return AuthenticationState(
      isAuthenticated: false,
      token: token,
    );
  }

  factory AuthenticationState.authenticated(
      {User user, String userId, String userEmail}) {
    return AuthenticationState(
      isAuthenticated: true,
      user: user,
      userId: userId,
      userEmail: userEmail,
    );
  }

  factory AuthenticationState.authenticating() {
    return AuthenticationState(
      isAuthenticated: false,
      isAuthenticating: true,
      showDialog: true,
    );
  }

  factory AuthenticationState.failure(String error) {
    return AuthenticationState(
      isAuthenticated: false,
      hasFailed: true,
      errorMessage: error,
    );
  }
}
