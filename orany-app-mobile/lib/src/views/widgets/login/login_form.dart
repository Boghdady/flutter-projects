import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_login_form_bloc.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/shared_text_field.dart';
import 'package:orany_app/src/views/widgets/login/forget_password_text.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationBloc bloc;
  LoginForm({this.bloc});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  LoginFormBloc _loginFormBloc;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _loginFormBloc = LoginFormBloc();
  }

  @override
  void dispose() {
    _loginFormBloc?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginFormBloc>(
      bloc: _loginFormBloc,
      child: Form(
        child: Column(
          children: <Widget>[
            SharedTextField(
              stream: _loginFormBloc.emailStream,
              hintText: 'البريد الالكتروني',
              onChanged: (value) => _loginFormBloc.emailSink.add(value),
              suffixIcon: Icons.email,
              prefixIcon: null,
              obscureText: false,
              controller: _emailController,
            ),
            UIHelper.verticalSpaceSmall,
            SharedTextField(
              stream: _loginFormBloc.passwordStream,
              hintText: 'كلمة المرور',
              onChanged: (value) => _loginFormBloc.passwordSink.add(value),
              suffixIcon: Icons.security,
              prefixIcon: Icons.lock,
              obscureText: true,
              controller: _passwordController,
            ),
            UIHelper.verticalSpaceMedium,
            ForgetPasswordLabel(),
            UIHelper.verticalSpaceMedium,
            StreamBuilder<bool>(
                stream: _loginFormBloc.validToLogin,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text(
                        ' تسجيل الدخول',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: (snapshot.hasData && snapshot.data == true)
                          ? () {
                              widget.bloc.emitEvent(
                                AuthenticationEventLogin(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          : null,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
