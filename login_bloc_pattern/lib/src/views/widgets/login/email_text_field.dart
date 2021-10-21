import 'package:flutter/material.dart';

import '../../../blocs/login_bloc.dart';

class EmailField extends StatelessWidget {
  final LoginBloc bloc;

  EmailField({this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: TextField(
            onChanged: (String value) => bloc.changeEmail.add(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Enter Email Address',
              errorText: snapshot.error,
            ),
          ),
        );
      },
    );
  }
}
