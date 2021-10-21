import 'package:clean_architecture_tdd/core/usecases/base_usecase.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository_domain.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

// This usecase will get it's data from NumberTriviaRepositoryDomain
class MockNumberTriviaRepositoryDomain extends Mock
    implements NumberTriviaRepositoryDomain {}

void main() {
  GetRandomNumberTriviaUseCase usecase;
  MockNumberTriviaRepositoryDomain mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepositoryDomain();
    usecase = GetRandomNumberTriviaUseCase(mockNumberTriviaRepository);
  });

  // Success expected result
  final tNumberTriviaEntity = NumberTriviaEntity(number: 1, text: 'test');

  test('should get random trivia  from the repository', () async {
    // arrange
    when(mockNumberTriviaRepository.getRandomNumberTrivia())
        .thenAnswer((_) async => Right(tNumberTriviaEntity));
    // act
    final acualResult = await usecase(NoParams());
    // assert
    expect(acualResult, Right(tNumberTriviaEntity));
    // optional
    verify(mockNumberTriviaRepository.getRandomNumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
