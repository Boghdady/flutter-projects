import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/screen_arguments/reset_password_args.dart';
import 'package:orany_app/src/views/bloc_widgets/bloc_state_builder.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';
import 'package:orany_app/src/views/widgets/verify_reset_password_code/verification_code_container.dart';

class VerifyResetPasswordScreen extends StatefulWidget {
  final String userId;
  final String userEmail;
  VerifyResetPasswordScreen(this.userId, this.userEmail);

  @override
  _VerifyResetPasswordScreenState createState() =>
      _VerifyResetPasswordScreenState();
}

class _VerifyResetPasswordScreenState extends State<VerifyResetPasswordScreen> {
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
    return Scaffold(
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
                  resetPasswordRoute,
                  ModalRoute.withName(verificationCodeRoute),
                  arguments: ResetPasswordArgs(userId: widget.userId),
                );
              });
            } else if (state.hasFailed) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showWaitingDialog(
                    context, state.showDialog); // dismiss waiting dialog
                showAlertDialog(
                  context,
                  state.errorMessage,
                  () => Navigator.pop(context),
                );
              });
            }
            return VerificationCodeContainer(
              bloc: _authBloc,
              userId: widget.userId,
              userEmail: widget.userEmail,
            );
          },
        ),
      ),
    );
  }
}
