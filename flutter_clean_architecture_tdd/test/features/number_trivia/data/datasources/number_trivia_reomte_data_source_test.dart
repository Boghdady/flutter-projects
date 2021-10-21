import 'dart:convert';

import 'package:clean_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:http/http.dart' as http;
import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  NumberTriviaRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDataSource =
        NumberTriviaRemoteDataSourceImpl(httpClinet: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
      (_) async => http.Response(fixtureReader('trivia.json'), 200),
    );
  }

  void setMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Some thing went wrong', 404));
  }

//===================================================================================== getConcreteNumberTrivia
  group('getConcreteNumberTrivia', () {
    final tNumber = 1;
    test(
        'should perform a GET request on a URl with a number in the endpoint and with application/json header',
        () {
      // 1) preparing
      setUpMockHttpClientSuccess200();
      // 2) implementation
      remoteDataSource.getConcreteNumberTrivia(tNumber);

      // 3) checking
      verify(mockHttpClient.get(
        'http://numbersapi.com/$tNumber',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return NumberTriviaModel when status code is 200 (success)',
        () async {
      // 1) preparing
      setUpMockHttpClientSuccess200();
      final tNumberTriviaModel =
          NumberTriviaModel.fromJson(json.decode(fixtureReader('trivia.json')));

      // 2) implementation
      final result = await remoteDataSource.getConcreteNumberTrivia(tNumber);

      // 3) checking
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw ServiceException when response.statusCode not equal 200',
        () {
      // 1) preparing
      setMockHttpClientFailure404();
      // 2) implementation
      final call = remoteDataSource.getConcreteNumberTrivia;
      // 3) checking
      // if call the getConcreteNumberTrivia() method throw ServerException
      expect(() => call(tNumber), throwsA(TypeMatcher<ServerException>()));
    });
  });

//===================================================================================== getRandomNumberTrivia

  group('getRandomNumberTrivia', () {
    test(
        'should perform a GET request on a URl with a number in the endpoint and with application/json header',
        () {
      // 1) preparing
      setUpMockHttpClientSuccess200();
      // 2) implementation
      remoteDataSource.getRandomNumberTrivia();

      // 3) checking
      verify(mockHttpClient.get(
        'http://numbersapi.com/random',
        headers: {'Content-Type': 'application/json'},
      ));
    });

    test('should return NumberTriviaModel when status code is 200 (success)',
        () async {
      // 1) preparing
      setUpMockHttpClientSuccess200();
      final tNumberTriviaModel =
          NumberTriviaModel.fromJson(json.decode(fixtureReader('trivia.json')));

      // 2) implementation
      final result = await remoteDataSource.getRandomNumberTrivia();

      // 3) checking
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw ServiceException when response.statusCode not equal 200',
        () {
      // 1) preparing
      setMockHttpClientFailure404();
      // 2) implementation
      final call = remoteDataSource.getRandomNumberTrivia;
      // 3) checking
      // if call the getConcreteNumberTrivia() method throw ServerException
      expect(() => call(), throwsA(TypeMatcher<ServerException>()));
    });
  });
}
