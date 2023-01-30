import 'dart:io';

import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:applifting_assignment/http/http_client_interface.dart';
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
            message: 'Bad request',
            statusCode: response.statusCode,
          );
        case 401:
        case 403:
          throw CustomHttpException(
            message: 'Unauthorized',
            statusCode: response.statusCode,
          );
        case 404:
          throw CustomHttpException(
            message: 'Not found',
            statusCode: response.statusCode,
          );
        default:
          throw CustomHttpException(
            message: 'Unexpected error',
            statusCode: response.statusCode,
          );
      }
    } on SocketException {
      throw const CustomHttpException(message: 'No internet connection');
    } catch (_) {
      rethrow;
    }
  }
}
