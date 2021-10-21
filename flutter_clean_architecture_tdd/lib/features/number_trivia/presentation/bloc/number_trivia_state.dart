import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

class Empty extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loading extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

class Loaded extends NumberTriviaState {
  final NumberTriviaEntity numberTriviaEntity;
  Loaded({
    @required this.numberTriviaEntity,
  });
  @override
  List<Object> get props => [numberTriviaEntity];
}

class Error extends NumberTriviaState {
  final String message;
  Error({@required this.message});

  @override
  List<Object> get props => [message];
}
