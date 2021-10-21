// note :  InputConverter class does not depend on any dependencies so we have no Mocking

import 'dart:math';

import 'package:clean_architecture_tdd/core/presentation/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedIntger', () {
    test('should return intger number when the input is string', () {
      // 1) preparing
      final str = '123';
      // 2) implementation
      final result = inputConverter.stringToUnsignedInteger(str);
      // 3) checking
      expect(result, Right(123));
    });

    test('should return InvalidInputFailure when the string is not a number',
        () {
      // 1) preparing
      final str = 'abc';
      // 2) implementation
      final result = inputConverter.stringToUnsignedInteger(str);
      // 3) checking
      expect(result, Left(InvalidInputFailure()));
    });

    test(
        'should rerun InvalidInputfailure when the input string is a negative number',
        () {
      // 1) preparing
      final str = '-122';
      // 2) implementation
      final result = inputConverter.stringToUnsignedInteger(str);
      // 3) checking
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
