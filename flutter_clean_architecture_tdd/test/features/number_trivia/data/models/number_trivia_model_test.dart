import 'dart:convert';

import 'package:clean_architecture_tdd/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:clean_architecture_tdd/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  test('Should be a subclass of NumberTriviaEntity', () {
    // act
    final actualResult = NumberTriviaModel(number: 1, text: 'Test Text');
    final expectedResult = isA<NumberTriviaEntity>();
    // assert
    expect(actualResult, expectedResult);
  });

  group('fromJson', () {
    test('should return a valid NumberTriviaModel when the number is intger',
        () async {
      // arrange
      final expectedResult = NumberTriviaModel(number: 1, text: 'Test Text');
      // act
      final Map<String, dynamic> jsonMap = json.decode(
          fixtureReader('trivia.json')); // convert String to dynamic jsonMap
      final actualResult = NumberTriviaModel.fromJson(jsonMap);
      // assert
      expect(actualResult, expectedResult);
    });

    test('should return a valid NumberTriviaModel when the number is double',
        () {
      final expectedResult = NumberTriviaModel(number: 1, text: 'Test Text');

      final Map<String, dynamic> jsonMap = json.decode(fixtureReader(
          'trivia_double.json')); // convert String to dynamic jsonMap
      final actualResult = NumberTriviaModel.fromJson(jsonMap);

      expect(actualResult, expectedResult);
    });
  });

  group('toJson', () {
    test('should return json map for trivia number', () async {
      final expectedResult = {'text': 'Test Text', 'number': 1};

      final numberTriviaModel = NumberTriviaModel(text: 'Test Text', number: 1);
      final actualResult = numberTriviaModel.toJson();

      expect(actualResult, expectedResult);
    });
  });
}
