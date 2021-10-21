import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/presentation/util/input_converter.dart';
import 'package:clean_architecture_tdd/core/usecases/base_usecase.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_concrete_number_trivia_usecase.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/usecases/get_random_number_trivia_usecase.dart';
import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetRandomNumberTriviaUseCase extends Mock
    implements GetRandomNumberTriviaUseCase {}

class MockGetConcreteNumberTriviaUseCase extends Mock
    implements GetConcreteNumberTriviaUseCase {}

class MockInputConverter extends Mock implements InputConverter {}

void main() {
  NumberTriviaBloc bloc;
  MockGetConcreteNumberTriviaUseCase mockGetConcreteTriviaUsecase;
  MockGetRandomNumberTriviaUseCase mockGetRandomTriviaUsecase;
  MockInputConverter mockInputConverter;

  setUp(() {
    mockGetConcreteTriviaUsecase = MockGetConcreteNumberTriviaUseCase();
    mockGetRandomTriviaUsecase = MockGetRandomNumberTriviaUseCase();
    mockInputConverter = MockInputConverter();

    bloc = NumberTriviaBloc(
      concreteTrivia: mockGetConcreteTriviaUsecase,
      randomTrivia: mockGetRandomTriviaUsecase,
      inputConverter: mockInputConverter,
    );
  });

  test('initialState should be Empty', () {
    expect(bloc.initialState, equals(Empty()));
  });

  group('GetConcreteNumerTriviaEvent', () {
    // The event takes in a String
    final tNumberString = '1';
    // This is the successful output of the InputConverter
    final tNumberParsed = int.parse(tNumberString);
    // NumberTrivia instance is needed too, of course
    final tNumberTriviaEntity = NumberTriviaEntity(number: 1, text: 'test');

    void setUpMockInputConverterSuccess() {
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(tNumberParsed));
    }

    test(
        'should call the InputConverter to validate and covert the string to an unsigned intger',
        () async {
      // 1) preparing
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Right(tNumberParsed));
      // 2) implementation
      bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
      await untilCalled(mockInputConverter.stringToUnsignedInteger(any));
      // 3) checking
      verify(mockInputConverter.stringToUnsignedInteger(tNumberString));
    });

    /*
    With Bloc, you call dispatch with an Event to execute the logic, but dispatch itself returns void. 
    The actual values are emitted from a completely different place - from the  Stream contained inside a state field of the Bloc.
    */
    test('should emit [Error] state when the input is invalid', () async {
      // 1) preparing
      when(mockInputConverter.stringToUnsignedInteger(any))
          .thenReturn(Left(InvalidInputFailure()));

      // 3) checking later
      final expected = [
        // The initial state is always emitted first
        Empty(),
        Error(message: INVALID_INPUT_FAILURE_MESSAGE),
      ];
      //  the Stream should emit the values from the List in a precise order with the emitsInOrder matcher
      expectLater(bloc, emitsInOrder(expected));

      // 2) implementation
      bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
    });

    test('should get data from the concrete usecase', () async {
      // 1) preparing
      setUpMockInputConverterSuccess();
      when(mockGetConcreteTriviaUsecase(any))
          .thenAnswer((_) async => Right(tNumberTriviaEntity));

      // 2) implementation
      bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
      await untilCalled(mockGetConcreteTriviaUsecase(any));

      // 3) checking
      verify(mockGetConcreteTriviaUsecase
          .call(NumberTriviParams(number: tNumberParsed)));
    });

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteTriviaUsecase(any))
            .thenAnswer((_) async => Right(tNumberTriviaEntity));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(numberTriviaEntity: tNumberTriviaEntity),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteTriviaUsecase(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        setUpMockInputConverterSuccess();
        when(mockGetConcreteTriviaUsecase(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaConcreteEvent(tNumberString));
      },
    );
  });

  group('GetRandomNumerTriviaEvent', () {
    // NumberTrivia instance is needed too, of course
    final tNumberTriviaEntity = NumberTriviaEntity(number: 1, text: 'test');

    test('should get data from the random usecase', () async {
      // 1) preparing
      when(mockGetRandomTriviaUsecase(any))
          .thenAnswer((_) async => Right(tNumberTriviaEntity));

      // 2) implementation
      bloc.add(GetNumberTriviaRandomEvent());
      await untilCalled(mockGetRandomTriviaUsecase(any));

      // 3) checking
      verify(mockGetRandomTriviaUsecase.call(NoParams()));
    });

    test(
      'should emit [Loading, Loaded] when data is gotten successfully',
      () async {
        // arrange
        when(mockGetRandomTriviaUsecase(any))
            .thenAnswer((_) async => Right(tNumberTriviaEntity));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Loaded(numberTriviaEntity: tNumberTriviaEntity),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaRandomEvent());
      },
    );

    test(
      'should emit [Loading, Error] when getting data fails',
      () async {
        // arrange
        when(mockGetRandomTriviaUsecase(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: SERVER_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaRandomEvent());
      },
    );

    test(
      'should emit [Loading, Error] with a proper message for the error when getting data fails',
      () async {
        // arrange
        when(mockGetRandomTriviaUsecase(any))
            .thenAnswer((_) async => Left(CacheFailure()));
        // assert later
        final expected = [
          Empty(),
          Loading(),
          Error(message: CACHE_FAILURE_MESSAGE),
        ];
        expectLater(bloc, emitsInOrder(expected));
        // act
        bloc.add(GetNumberTriviaRandomEvent());
      },
    );
  });
}
