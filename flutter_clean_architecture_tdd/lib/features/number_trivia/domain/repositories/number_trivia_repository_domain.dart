import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';

// Domain Repository will cantain the contract and the implementation will be in data layer repository
abstract class NumberTriviaRepositoryDomain {
  // Success --> return NumberTrivia entity
  // Failure --> return Failure
  Future<Either<Failure, NumberTriviaEntity>> getConcreteNumberTrivia(
      int number);
  Future<Either<Failure, NumberTriviaEntity>> getRandomNumberTrivia();
}
