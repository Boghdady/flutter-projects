import 'package:flutter/material.dart';

import '../../../blocs/login_bloc.dart';

class CounterShip extends StatelessWidget {
  final LoginBloc bloc;

  CounterShip({this.bloc});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.counter,
      builder: (context, AsyncSnapshot<int> snapshot) {
        return Chip(
          label: Text(
            (snapshot.data ?? 0).toString(),
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        );
      },
    );
  }
}
