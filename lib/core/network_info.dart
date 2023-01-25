import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> isInternetConnectionAvailable();
}

class NetworkInfo implements INetworkInfo {
  @override
  Future<bool> isInternetConnectionAvailable() async {
    return await InternetConnectionChecker().hasConnection;
  }
}
