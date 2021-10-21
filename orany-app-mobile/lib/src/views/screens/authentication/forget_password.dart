import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_state.dart';
import 'package:orany_app/src/helpers/constants.dart';
import 'package:orany_app/src/helpers/screen_arguments/verification_code_args.dart';
import 'package:orany_app/src/views/bloc_widgets/bloc_state_builder.dart';
import 'package:orany_app/src/views/shared/dialog_helper.dart';
import 'package:orany_app/src/views/widgets/forget_password/forgot_password_container.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
              verificationCodeRoute,
              ModalRoute.withName(forgetPasswordRoute),
              arguments: VerifyResetPasswordArgs(
                userId: state.userId,
                userEmail: state.userEmail,
              ),
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
        return ForgotPasswordContainer(_authBloc);
      },
    );
  }
}
