import 'package:applifting_assignment/core/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../app/company_info/data/repository/company_info_repository_test.mocks.dart';

class MockNetworkInfo extends Mock implements INetworkInfo {}

@GenerateMocks([MockNetworkInfo])
void main() {
  final newtorkInfo = MockMockNetworkInfo();

  group('NetworkInfo isInternetConnectionAvailable', () {
    test('isInternetConnectionAvailable returns true when connection is available', () async {
      when(newtorkInfo.isInternetConnectionAvailable()).thenAnswer((_) async => true);

      final internetAvailable = await newtorkInfo.isInternetConnectionAvailable();

      expect(internetAvailable, isA<bool>());
      expect(internetAvailable, true);
    });

    test('isInternetConnectionAvailable returns false when connection is not available', () async {
      when(newtorkInfo.isInternetConnectionAvailable()).thenAnswer((_) async => false);

      final internetAvailable = await newtorkInfo.isInternetConnectionAvailable();

      expect(internetAvailable, isA<bool>());
      expect(internetAvailable, false);
    });
  });
}
