import 'package:flutter/material.dart';
import 'package:login_bloc_section14/src/helpers/constants.dart';
import '../../../blocs/login_bloc.dart';

class SubmitButton extends StatelessWidget {
  final LoginBloc bloc;

  SubmitButton({this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          return Container(
            margin: EdgeInsets.only(top: 16.0),
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              child: Text(
                ' تسجيل الدخول',
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                if (snapshot.hasData == true) {
                  bloc.btnSubmitClick();
                  print(snapshot.data);
                  Navigator.pushNamed(context, productsRoute);
                } else {
                  return null;
                }
              },
            ),
          );
        });
  }
}
