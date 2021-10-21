import 'package:clean_architecture_tdd/core/network_connection/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

void main() {
  MockDataConnectionChecker mockDataConnectionChecker;
  NetworkInfoImpl networkInfo;

  setUp(() {
    mockDataConnectionChecker = new MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(mockDataConnectionChecker);
  });

  group('isConnected', () {
    /*
      Calling NetworkInfo().isConnected is really only a nickname for calling DataConnectionChecker().hasConnection.
       We're simply hiding the 3rd party library behind an interface of our own class. We can check if the call to 
       the property is "forwarded" by checking if the Future object returned by isConnected is exactly the same as 
       the one returned by hasConnection.
    */
    test('should forward the call to DataConnectionChecker.hasConnection', () {
      // 1) preparing
      final tHasConnectionFuture = Future.value(true);
      when(mockDataConnectionChecker.hasConnection)
          .thenAnswer((_) => tHasConnectionFuture);

      // 2) implementation
      final result = networkInfo.isConnected;

      // 3) checking
      verify(mockDataConnectionChecker.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
