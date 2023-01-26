import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> isInternetConnectionAvailable();
}

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> isInternetConnectionAvailable() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (kIsWeb) {
        return true;
      }
      return await InternetConnectionChecker().hasConnection;
    } else {
      return false;
    }
  }
}
