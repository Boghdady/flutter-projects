import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/helpers/constants.dart';

import 'package:orany_app/src/views/bloc_widgets/bloc_state_builder.dart';
import 'package:orany_app/src/views/screens/bottom_bar_screens/bottom_nav_bar_container.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';
import 'package:orany_app/src/views/widgets/login/login_container.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ///
  /// Prevents the use of the "back" button
  ///
  Future<bool> _onWillPopScope() async {
    return false;
  }

  AuthenticationBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthenticationBloc();
  }

  @override
  void dispose() {
    _authBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    AuthenticationBloc bloc = BlocProvider.of<AuthenticationBloc>(context);
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        body: Container(
          child: BlocEventStateBuilder<AuthenticationState>(
            bloc: _authBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state.isAuthenticating) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showWaitingDialog(context, state.showDialog);
                });
              } else if (state.isAuthenticated) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // Push to home Screen
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    bottomNavBarContainerRoute,
                    ModalRoute.withName(loginRoute),
                  );
                });
                print('--------------------------------${state.user.name}');
              } else if (state.hasFailed) {
                print('-------- ${state.errorMessage}');
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  showWaitingDialog(
                      context, state.showDialog); // dismiss waiting dialog
                  showAlertDialog(
                    context,
                    state.errorMessage,
                    () => Navigator.of(context).pop(),
                  );
                });
              }
              return LoginContainer(_authBloc);
            },
          ),
        ),
      ),
    );
  }
}
