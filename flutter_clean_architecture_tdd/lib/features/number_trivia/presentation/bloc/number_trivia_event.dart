part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();
}

class GetNumberTriviaConcreteEvent extends NumberTriviaEvent {
  final String number;

  GetNumberTriviaConcreteEvent(this.number);

  @override
  List<Object> get props => [number];
}

class GetNumberTriviaRandomEvent extends NumberTriviaEvent {
  @override
  List<Object> get props => [];
}
