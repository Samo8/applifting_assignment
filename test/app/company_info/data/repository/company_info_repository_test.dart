import 'package:applifting_assignment/app/company_info/data/datasources/company_info_local_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_remote_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:applifting_assignment/app/company_info/data/dto/headquarters_dto.dart';
import 'package:applifting_assignment/app/company_info/data/dto/links_dto.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository.dart';
import 'package:applifting_assignment/core/network_info.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'company_info_repository_test.mocks.dart';

class MockCompanyInfoRemoteDataSource extends Mock implements ICompanyInfoRemoteDataSource {}

class MockCompanyInfoLocalDataSource extends Mock implements ICompanyInfoLocalDataSource {}

class MockNetworkInfo extends Mock implements INetworkInfo {}

@GenerateMocks([MockCompanyInfoRemoteDataSource, MockCompanyInfoLocalDataSource, MockNetworkInfo])
void main() {
  late final MockCompanyInfoRemoteDataSource mockRemoteDataSource;
  late final MockCompanyInfoLocalDataSource mockLocalDataSource;
  late final MockNetworkInfo mockNetworkInfo;
  late final CompanyInfoDTO companyInfo;
  late final CompanyInfoRepository repository;

  mockRemoteDataSource = MockMockCompanyInfoRemoteDataSource();
  mockLocalDataSource = MockMockCompanyInfoLocalDataSource();
  mockNetworkInfo = MockMockNetworkInfo();

  repository = CompanyInfoRepository(
    remoteDataSource: mockRemoteDataSource,
    localDataSource: mockLocalDataSource,
    networkInfo: mockNetworkInfo,
  );

  companyInfo = const CompanyInfoDTO(
    headquarters: HeadquartersDTO(
      address: '1 Rocket Road',
      city: 'Hawthorne',
      state: 'California',
    ),
    links: LinksDTO(
      elonTwitter: 'https://twitter.com/elonmusk',
      flickr: 'https://www.flickr.com/photos/spacex',
      twitter: 'https://twitter.com/spacex',
      website: 'https://www.spacex.com/',
    ),
    launchSites: 3,
    name: 'Space Exploration Technologies Corp.',
    founded: 2002,
    ceo: 'Elon Musk',
    employees: 10000,
    coo: 'Gwynne Shotwell',
    cto: 'Elon Musk',
    ctoPropulsion: 'Tom Mueller',
    founder: 'Elon Musk',
    id: 'SpaceX',
    summary: 'Space Exploration Technologies Corp., better known as SpaceX.',
    testSites: 1,
    valuation: 3,
    vehicles: 3,
  );

  group('fetchCompanyInfo', () {
    test('should return company info from remote if internet is available', () async {
      when(mockNetworkInfo.isInternetConnectionAvailable()).thenAnswer((_) async => true);
      when(mockRemoteDataSource.fetchCompanyInfo()).thenAnswer((_) async => companyInfo);
      final result = await repository.fetchCompanyInfo();

      verify(mockRemoteDataSource.fetchCompanyInfo());
      expect(result, companyInfo);
    });

    test('should return company info from local if internet is not available', () async {
      when(mockNetworkInfo.isInternetConnectionAvailable())
          .thenAnswer((_) async => Future.value(false));
      when(mockLocalDataSource.fetchCompanyInfo())
          .thenAnswer((_) async => Future.value(companyInfo));

      final result = await repository.fetchCompanyInfo();

      verify(mockLocalDataSource.fetchCompanyInfo());
      expect(result, companyInfo);
    });

    test('should return error if both remote and local fetch fail', () async {
      when(mockNetworkInfo.isInternetConnectionAvailable())
          .thenAnswer((_) async => Future.value(false));
      when(mockLocalDataSource.fetchCompanyInfo()).thenThrow(Exception());

      expect(
        repository.fetchCompanyInfo(),
        throwsA(isA<Exception>()),
      );
    });
  });
}
