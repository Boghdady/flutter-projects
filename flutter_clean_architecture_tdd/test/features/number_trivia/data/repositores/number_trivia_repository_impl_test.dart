import 'package:clean_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_architecture_tdd/core/error/failures.dart';
import 'package:clean_architecture_tdd/core/network_connection/network_info.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/repositories/number_trivi_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRemoteDataSource extends Mock
    implements NumberTriviaRemoteDataSource {}

class MockLocalDataSource extends Mock implements NumberTriviaLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  NumberTriviaRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

//============================================================================ getConcreteNumberTrivia
  group('getConcreteNumberTrivia parent group', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: 'test text');
    final tNumberTriviaEntity = tNumberTriviaModel;

    test('should check if the device is online', () {
      // 1) preparing
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // 2) implementation
      repository.getConcreteNumberTrivia(tNumber);
      // 3) checking
      verify(mockNetworkInfo
          .isConnected); // verify that networkInfo.isConnected is called
    });

    group('device is online child group', () {
      setUp(() {
        // This will run before all tests in this group
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('should return data when the call to remote datasourc is success',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        final result = await repository.getConcreteNumberTrivia(tNumber);
        // 3) checking
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        expect(result, equals(Right(tNumberTriviaEntity)));
      });

      test(
          'should cache data locally when the call to the remote data source is success',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        await repository.getConcreteNumberTrivia(tNumber);
        // 3) checking
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaEntity));
      });

      test(
          'should return ServerFailure when the call to remote data source is unsuccessful ',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getConcreteNumberTrivia(tNumber))
            .thenThrow(ServerException());
        // 2) implementation
        final result = await repository.getConcreteNumberTrivia(tNumber);
        // 3) checking
        verify(mockRemoteDataSource.getConcreteNumberTrivia(tNumber));
        verifyZeroInteractions(mockLocalDataSource); // no call
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline child group', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        // 1) preparing
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        final result = await repository.getConcreteNumberTrivia(tNumber);
        // 3) checking
        verify(mockLocalDataSource.getLastNumberTrivia());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Right(tNumberTriviaModel)));
      });

      test('hould return CacheFailure when there is no cached data present',
          () async {
        // 1) preparing
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());
        // 2) implementation
        final result = await repository.getConcreteNumberTrivia(tNumber);
        // 3) checking
        verify(mockLocalDataSource.getLastNumberTrivia());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });

//============================================================================ getRandomNumberTrivia
  group('getRandomNumberTrivia parent group', () {
    // DATA FOR THE MOCKS AND ASSERTIONS
    // We'll use these three variables throughout all the tests
    final tNumber = 1;
    final tNumberTriviaModel =
        NumberTriviaModel(number: tNumber, text: 'test text');
    final tNumberTriviaEntity = tNumberTriviaModel;

    test('should check if the device is online', () {
      // 1) preparing
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      // 2) implementation
      repository.getRandomNumberTrivia();
      // 3) checking
      verify(mockNetworkInfo
          .isConnected); // verify that networkInfo.isConnected is called
    });

    group('device is online child group', () {
      setUp(() {
        // This will run before all tests in this group
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test('should return data when the call to remote datasourc is success',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        final result = await repository.getRandomNumberTrivia();
        // 3) checking
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        expect(result, equals(Right(tNumberTriviaEntity)));
      });

      test(
          'should cache data locally when the call to the remote data source is success',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        await repository.getRandomNumberTrivia();
        // 3) checking
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verify(mockLocalDataSource.cacheNumberTrivia(tNumberTriviaEntity));
      });

      test(
          'should return ServerFailure when the call to remote data source is unsuccessful ',
          () async {
        // 1) preparing
        when(mockRemoteDataSource.getRandomNumberTrivia())
            .thenThrow(ServerException());
        // 2) implementation
        final result = await repository.getRandomNumberTrivia();
        // 3) checking
        verify(mockRemoteDataSource.getRandomNumberTrivia());
        verifyZeroInteractions(mockLocalDataSource); // no call
        expect(result, equals(Left(ServerFailure())));
      });
    });

    group('device is offline child group', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test(
          'should return last locally cached data when the cached data is present',
          () async {
        // 1) preparing
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenAnswer((_) async => tNumberTriviaModel);
        // 2) implementation
        final result = await repository.getRandomNumberTrivia();
        // 3) checking
        verify(mockLocalDataSource.getLastNumberTrivia());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Right(tNumberTriviaEntity)));
      });

      test('hould return CacheFailure when there is no cached data present',
          () async {
        // 1) preparing
        when(mockLocalDataSource.getLastNumberTrivia())
            .thenThrow(CacheException());
        // 2) implementation
        final result = await repository.getRandomNumberTrivia();
        // 3) checking
        verify(mockLocalDataSource.getLastNumberTrivia());
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result, equals(Left(CacheFailure())));
      });
    });
  });
}
