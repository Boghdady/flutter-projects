import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository_domain.dart';

class GetConcreteNumberTriviaUseCase
    implements BaseUseCase<NumberTriviaEntity, NumberTriviParams> {
  final NumberTriviaRepositoryDomain repository;

  GetConcreteNumberTriviaUseCase(this.repository);

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(
      NumberTriviParams params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }
}

class NumberTriviParams extends Equatable {
  final int number;

  NumberTriviParams({@required this.number});

  @override
  List<Object> get props => [number];
}
