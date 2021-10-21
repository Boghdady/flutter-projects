import 'package:clean_architecture_tdd/core/usecases/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository_domain.dart';

class GetRandomNumberTriviaUseCase
    implements BaseUseCase<NumberTriviaEntity, NoParams> {
  final NumberTriviaRepositoryDomain repository;
  GetRandomNumberTriviaUseCase(this.repository);

  @override
  Future<Either<Failure, NumberTriviaEntity>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}
