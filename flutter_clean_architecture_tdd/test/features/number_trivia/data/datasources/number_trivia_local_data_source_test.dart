import 'dart:convert';

import 'package:clean_architecture_tdd/core/error/exceptions.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  MockSharedPreferences mockSharedPreferences;
  NumberTriviaLocalDataSourceImpl localDataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = NumberTriviaLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group('getLastNumberTrivia', () {
    // Storing complex objects such as NumberTrivia inside shared preferences is possible only in a string format
    test(
        'should return NumberTrivia from SharedPreferences when there is one in the cache',
        () async {
      // 1) preparing
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixtureReader('trivia_cached.json'));
      // json.decode(String) ==> convert String to json
      final tNumberTriviaModel = NumberTriviaModel.fromJson(
          json.decode(fixtureReader('trivia_cached.json')));

      // 2) implementation
      final result = await localDataSource.getLastNumberTrivia();

      // 3) checking
      verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
      expect(result, equals(tNumberTriviaModel));
    });

    test('should throw a CacheException when there is not a cached value', () {
      // 1) preparing
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // Not calling the method here, just storing it inside a call variable
      final call = localDataSource.getLastNumberTrivia;
      // if call the getLastNumberTrivia() method throw CacheException
      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });
}
