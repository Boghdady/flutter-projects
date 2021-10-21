import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/repositories/number_trivia_repository_domain.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

// This usecase will get it's data from NumberTriviaRepository
class MockNumberTriviaRepositoryDomain extends Mock
    implements NumberTriviaRepositoryDomain {}

void main() {
  GetConcreteNumberTriviaUseCase usecase;
  MockNumberTriviaRepositoryDomain mockNumberTriviaRepository;
  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepositoryDomain();
    usecase = GetConcreteNumberTriviaUseCase(mockNumberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTriviaEntity = NumberTriviaEntity(number: 1, text: 'test');

  test('should get trivia from the number from the repository', () async {
    // 1) arrange
    // "On the fly" implementation of the Repository using the Mockito package.
    // When getConcreteNumberTrivia is called with any argument, always answer with
    // the Right "side" of Either containing a test NumberTrivia object.
    when(mockNumberTriviaRepository.getConcreteNumberTrivia(any))
        .thenAnswer((_) async => Right(tNumberTriviaEntity));

    // 2) act
    // The "act" phase of the test. Call the not-yet-existent method.
    final acualResult = await usecase(NumberTriviParams(number: tNumber));

    // 3) assert
    // UseCase should simply return whatever was returned from the Repository
    expect(acualResult, Right(tNumberTriviaEntity));
    // optional
    // Verify that the method has been called on the Repository
    verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
    // Only the above method should be called and nothing more.
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
