import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_forgot_password_form_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_register_form_bloc.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/views/shared/shared_button.dart';
import 'package:orany_app/src/views/shared/shared_text_field.dart';

class ForgotPasswordFrom extends StatefulWidget {
  final AuthenticationBloc bloc;

  ForgotPasswordFrom({this.bloc});
  @override
  _ForgotPasswordFromState createState() => _ForgotPasswordFromState();
}

class _ForgotPasswordFromState extends State<ForgotPasswordFrom> {
  TextEditingController _emailController;
  ForgotPasswordFormBloc _forgotPasswordFromBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _forgotPasswordFromBloc = ForgotPasswordFormBloc();
  }

  @override
  void dispose() {
    _forgotPasswordFromBloc?.dispose();
    _emailController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordFormBloc>(
      bloc: _forgotPasswordFromBloc,
      child: Form(
        child: Column(
          children: <Widget>[
            SharedTextField(
              controller: _emailController,
              stream: _forgotPasswordFromBloc.emailStream,
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني',
              onChanged: _forgotPasswordFromBloc.onEmailChanged,
              suffixIcon: Icons.email,
              prefixIcon: null,
              obscureText: false,
            ),
            SharedButton(
                onPressed: () {
                  widget.bloc.emitEvent(AuthenticationEventForgotPassword(
                      email: _emailController.text));
                },
                title: 'استمرار'),
          ],
        ),
      ),
    );
  }
}
