import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:clean_architecture_tdd/features/number_trivia/presentation/widgets/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class NumberTriviaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Trivia"),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NumberTriviaBloc>(),
      child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (BuildContext context, state) {
                  if (state is Empty) {
                    return MessageDisplay(message: 'Start Search!');
                  } else if (state is Error) {
                    return MessageDisplay(message: state.message);
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(
                        numberTrivia: state.numberTriviaEntity);
                  } else {
                    return Container();
                  }
                },
              ),
              SizedBox(height: 10),
              TriviaControls(),
            ],
          ),
        )),
      ),
    );
  }
}
