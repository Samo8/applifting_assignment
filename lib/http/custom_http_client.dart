import 'dart:io';

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
          throw const HttpException('Bad request');
        case 401:
        case 403:
          throw const HttpException('Unauthorized');
        case 404:
          throw const HttpException('Not found');
        default:
          throw HttpException('Unexpected error, status code: ${response.statusCode}');
      }
    } on SocketException {
      throw const HttpException('No internet connection');
    } catch (_) {
      rethrow;
    }
  }
}
