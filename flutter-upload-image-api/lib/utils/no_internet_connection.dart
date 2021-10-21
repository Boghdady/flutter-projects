import 'package:connectivity/connectivity.dart';
import 'package:fluter_upload_image_api/utils/exceptions.dart';

Future<void> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.mobile &&
      connectivityResult != ConnectivityResult.wifi) {
    throw NoInternetConnectionException();
  }
}
