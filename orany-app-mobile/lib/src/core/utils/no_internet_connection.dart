import 'package:connectivity/connectivity.dart';
import 'package:orany_app/src/core/utils/exceptions.dart';

Future<void> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi) {
    throw NoInternetConnectionException();
  }
}
