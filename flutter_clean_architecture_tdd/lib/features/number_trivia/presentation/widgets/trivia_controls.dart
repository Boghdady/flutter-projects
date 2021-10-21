import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TriviaControls extends StatefulWidget {
  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Input a number',
          ),
          onChanged: (val) {
            inputStr = val;
          },
          onSubmitted: (_) {
            addConcreteEvent();
          },
        ),
        SizedBox(height: 20),
        Row(children: <Widget>[
          Expanded(
            child: RaisedButton(
              onPressed: addConcreteEvent,
              child: Text('Search'),
              color: Theme.of(context).accentColor,
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: RaisedButton(
              onPressed: addRandomTriviaEvent,
              child: Text('Get random trivia'),
            ),
          )
        ])
      ],
    );
  }

  void addConcreteEvent() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetNumberTriviaConcreteEvent(inputStr));
  }

  void addRandomTriviaEvent() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetNumberTriviaRandomEvent());
  }
}
