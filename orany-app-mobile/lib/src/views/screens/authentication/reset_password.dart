import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/views/bloc_widgets/bloc_state_builder.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';
import 'package:orany_app/src/views/widgets/reset_password/reset_password_container.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String userId;

  ResetPasswordScreen(this.userId);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
    return BlocEventStateBuilder<AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
        if (state.isAuthenticating) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showWaitingDialog(context, state.showDialog);
          });
        } else if (state.isAuthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Push to VerificationCode Screen
            Navigator.of(context).pushNamedAndRemoveUntil(
              loginRoute,
              ModalRoute.withName(resetPasswordRoute),
            );
          });
        } else if (state.hasFailed) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showWaitingDialog(
                context, state.showDialog); // dismiss waiting dialog
            showAlertDialog(context, state.errorMessage,
                () => Navigator.of(context, rootNavigator: true).pop());
          });
        }
        return ResetPasswordContainer(bloc: _authBloc, userId: widget.userId);
      },
    );
  }
}
