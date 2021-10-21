import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_bloc.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_event.dart';
import 'package:orany_app/src/core/blocs/authentication/authentication_register_form_bloc.dart';
import 'package:orany_app/src/core/utils/provider.dart';
import 'package:orany_app/src/helpers/ui_helpers.dart';
import 'package:orany_app/src/views/shared/shared_text_field.dart';

class RegistrationFrom extends StatefulWidget {
//  final RegistrationBloc registrationBloc;
  final AuthenticationBloc bloc;
  RegistrationFrom({this.bloc});
  @override
  _RegistrationFromState createState() => _RegistrationFromState();
}

class _RegistrationFromState extends State<RegistrationFrom> {
  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _retypeController;
  RegistrationFormBloc _registrationFormBloc;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _retypeController = TextEditingController();
    _retypeController = TextEditingController();
    _registrationFormBloc = RegistrationFormBloc();
  }

  @override
  void dispose() {
    _registrationFormBloc?.dispose();
    _nameController?.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
    _retypeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationFormBloc>(
      bloc: _registrationFormBloc,
      child: Form(
        child: Column(
          children: <Widget>[
            SharedTextField(
              controller: _nameController,
              stream: _registrationFormBloc.nameStream,
              textInputType: TextInputType.text,
              hintText: 'الاسم',
              onChanged: _registrationFormBloc.onNameChanged,
              suffixIcon: Icons.person_pin,
              prefixIcon: null,
              obscureText: false,
            ),
            UIHelper.verticalSpaceSmall,
            SharedTextField(
              controller: _emailController,
              stream: _registrationFormBloc.emailStream,
              textInputType: TextInputType.emailAddress,
              hintText: 'البريد الالكتروني',
              onChanged: _registrationFormBloc.onEmailChanged,
              suffixIcon: Icons.email,
              prefixIcon: null,
              obscureText: false,
            ),
            UIHelper.verticalSpaceSmall,
            SharedTextField(
              controller: _passwordController,
              stream: _registrationFormBloc.passwordStream,
              textInputType: TextInputType.text,
              hintText: 'كلمة المرور',
              onChanged: _registrationFormBloc.onPasswordChanged,
              suffixIcon: Icons.security,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            UIHelper.verticalSpaceSmall,
            SharedTextField(
              controller: _retypeController,
              stream: _registrationFormBloc.confirmPasswordStream,
              textInputType: TextInputType.text,
              hintText: 'تأكيد كلمة المرور',
              onChanged: _registrationFormBloc.onRetypePasswordChanged,
              suffixIcon: Icons.security,
              prefixIcon: Icons.lock,
              obscureText: true,
            ),
            UIHelper.verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(
                  'باستمرارك تكون قد وافقت علي',
                  style: Theme.of(context).textTheme.body2,
                ),
                UIHelper.horizontalSpaceXSmall,
                InkWell(
                  onTap: () {},
                  child: Text(
                    'الشروط والاحكام',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(
                  'و',
                  style: Theme.of(context).textTheme.body2,
                ),
                UIHelper.horizontalSpaceXSmall,
                InkWell(
                  onTap: () {},
                  child: Text(
                    'سياسية الخصوصية',
                    style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Colors.teal,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            UIHelper.verticalSpaceSmall,
            StreamBuilder<bool>(
                stream: _registrationFormBloc.registerValid,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    child: RaisedButton(
                      child: Text(
                        'انشاء حساب',
                        style: Theme.of(context).textTheme.button,
                      ),
                      onPressed: (snapshot.hasData && snapshot.data == true)
                          ? () {
                              widget.bloc.emitEvent(
                                AuthenticationEventRegister(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  passwordConfirm: _retypeController.text,
                                  photo: 'photo1',
                                  role: 'user',
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
