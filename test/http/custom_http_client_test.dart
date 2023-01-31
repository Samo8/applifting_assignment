import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:applifting_assignment/http/custom_http_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'custom_http_client_test.mocks.dart';

class MockClient extends Mock implements http.Client {}

@GenerateMocks([MockClient])
void main() {
  final client = MockMockClient();
  final customClient = CustomHttpClient(
    client: client,
    baseUrl: 'https://www.example.com',
  );

  group('CustomHttpClient', () {
    test('returns success response', () async {
      when(client.get(any)).thenAnswer((_) async => http.Response('content', 200));

      final response = await customClient.get('200');

      expect(response.statusCode, 200);
      expect(response.body, 'content');
    });

    test('throws HttpException for 400 response', () async {
      when(client.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('error', 400));

      expect(
        () async => await customClient.get('/'),
        throwsA(
          allOf(
            isA<CustomHttpException>().having((e) => e.message, '', 'Bad request'),
          ),
        ),
      );
    });

    test('throws HttpException for 401/403 response', () async {
      when(client.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 401));

      expect(
        () async => await customClient.get('/'),
        throwsA(
          allOf(
            isA<CustomHttpException>().having((e) => e.message, '', 'Unauthorized'),
          ),
        ),
      );
    });

    test('throws HttpException for 404 response', () async {
      when(client.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('', 404));

      expect(
        () async => await customClient.get('/'),
        throwsA(
          allOf(
            isA<CustomHttpException>().having((e) => e.message, '', 'Not found'),
          ),
        ),
      );
    });
  });
}
