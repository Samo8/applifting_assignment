import 'package:http/http.dart';

abstract class IHttpClient {
  Future<Response> get(
    String url, {
    Map<String, String>? headers,
  });
}
