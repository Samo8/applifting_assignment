import 'dart:io';

import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:applifting_assignment/http/http_client_interface.dart';
import 'package:applifting_assignment/i18n/strings.g.dart';
import 'package:http/http.dart' as http;

class CustomHttpClient implements IHttpClient {
  final http.Client client;
  final String baseUrl;

  CustomHttpClient({
    required this.client,
    required this.baseUrl,
  });

  @override
  Future<http.Response> get(
    String url, {
    Map<String, String>? headers,
  }) async {
    try {
      final uri = Uri.parse('$baseUrl/$url');
      final response = await client.get(uri, headers: headers);

      switch (response.statusCode) {
        case 200:
          return response;
        case 400:
          throw CustomHttpException(
            message: t.http.badRequest,
            statusCode: response.statusCode,
          );
        case 401:
        case 403:
          throw CustomHttpException(
            message: t.http.unauthorized,
            statusCode: response.statusCode,
          );
        case 404:
          throw CustomHttpException(
            message: t.http.notFound,
            statusCode: response.statusCode,
          );
        default:
          throw CustomHttpException(
            message: t.http.unexpectedError,
            statusCode: response.statusCode,
          );
      }
    } on SocketException {
      throw CustomHttpException(message: t.general.noInternet);
    } catch (_) {
      rethrow;
    }
  }
}
