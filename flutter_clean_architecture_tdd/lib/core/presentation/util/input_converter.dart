import 'package:dartz/dartz.dart';

import '../../error/failures.dart';

class InputConverter {
  // 1- Convert String to Intger .
  // 2= it will also make sure that the inputted number isn't negative
  Either<Failure, int> stringToUnsignedInteger(String str) {
    try {
      final intgerNumber = int.parse(str);
      if (intgerNumber < 0) throw FormatException();
      return Right(intgerNumber);
      // Parsing an invalid String to an int throws a [FormatException]
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => null;
}
