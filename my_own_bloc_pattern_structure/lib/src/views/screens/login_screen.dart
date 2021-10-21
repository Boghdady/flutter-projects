import 'package:flutter/material.dart';
import 'package:login_bloc_section14/src/blocs/provider.dart';
import 'package:login_bloc_section14/src/views/widgets/login/counter_chip.dart';
import 'package:login_bloc_section14/src/views/widgets/login/email_text_field.dart';
import 'package:login_bloc_section14/src/views/widgets/login/password_text_field.dart';
import 'package:login_bloc_section14/src/views/widgets/login/submit_button.dart';

import '../../blocs/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = LoginBloc();
  }

  @override
  void dispose() {
    bloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
        actions: <Widget>[
          CounterShip(bloc: bloc),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocProvider<LoginBloc>(
          bloc: bloc,
          child: SizedBox(
            child: Container(
              margin: EdgeInsets.only(
                right: 24.0,
                left: 24.0,
                bottom: 24.0,
                top: MediaQuery.of(context).size.height * 0.20,
              ),
              child: Column(
                children: <Widget>[
                  EmailField(bloc: bloc),
                  PasswordField(bloc: bloc),
                  SubmitButton(bloc: bloc),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
