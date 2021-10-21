import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_reset_password_form_bloc.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/shared_text_field.dart';

class ResetPasswordForm extends StatefulWidget {
  final AuthenticationBloc bloc;
  final String userId;
  ResetPasswordForm({this.bloc, this.userId});

  @override
  _ResetPasswordFormState createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  TextEditingController _passwordController;
  TextEditingController _passwordConfirmController;
  ResetPasswordFormBloc _resetPasswordFromBloc;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _passwordConfirmController = TextEditingController();
    _resetPasswordFromBloc = ResetPasswordFormBloc();
  }

  @override
  void dispose() {
    _resetPasswordFromBloc?.dispose();
    _passwordController?.dispose();
    _passwordConfirmController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordFormBloc>(
      bloc: _resetPasswordFromBloc,
      child: Form(
        child: Column(
          children: <Widget>[
            SharedTextField(
              controller: _passwordController,
              stream: _resetPasswordFromBloc.passwordStream,
              textInputType: TextInputType.text,
              hintText: 'كلمة المرور',
              onChanged: _resetPasswordFromBloc.onPasswordChanged,
              suffixIcon: Icons.security,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            UIHelper.verticalSpaceSmall,
            SharedTextField(
              controller: _passwordConfirmController,
              stream: _resetPasswordFromBloc.confirmPasswordStream,
              textInputType: TextInputType.text,
              hintText: 'تأكيد كلمة المرور',
              onChanged: _resetPasswordFromBloc.onPasswordConfirmChanged,
              suffixIcon: Icons.security,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            UIHelper.verticalSpaceMedium,
            StreamBuilder<bool>(
                stream: _resetPasswordFromBloc.resetValid,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text(
                        'حفظ',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: (snapshot.hasData && snapshot.data == true)
                          ? () {
                              widget.bloc.emitEvent(
                                AuthenticationEventResetPassword(
                                  userId: widget.userId,
                                  password: _passwordController.text,
                                  passwordConfirm:
                                      _passwordConfirmController.text,
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
