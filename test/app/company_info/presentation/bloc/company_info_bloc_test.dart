import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/domain/company_info.dart';
import 'package:applifting_assignment/app/company_info/domain/headquarters.dart';
import 'package:applifting_assignment/app/company_info/domain/links.dart';
import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'company_info_bloc_test.mocks.dart';

class MockCompanyInfoService extends Mock implements ICompanyInfoService {}

@GenerateMocks([MockCompanyInfoService])
void main() {
  final companyInfoService = MockMockCompanyInfoService();

  group('CompanyInfoBloc', () {
    const companyInfo = CompanyInfo(
      headquarters: Headquarters(
        address: '1 Rocket Road',
        city: 'Hawthorne',
        state: 'California',
      ),
      links: Links(
        twitter: 'https://twitter.com/spacex',
        website: 'https://www.spacex.com/',
      ),
      launchSites: 3,
      name: 'Space Exploration Technologies Corp.',
      founded: 2002,
      ceo: 'Elon Musk',
      employees: 10000,
      cto: 'Elon Musk',
      summary: 'Space Exploration Technologies Corp., better known as SpaceX.',
      testSites: 1,
      valuation: 3,
      vehicles: 3,
    );

    when(companyInfoService.getCompanyInfo()).thenAnswer((_) async => companyInfo);

    blocTest(
      'emits [CompanyInfoLoadingState, CompanyInfoLoadedState] when CompanyInfoFetchDataEvent is added',
      build: () => CompanyInfoBloc(companyInfoService),
      act: (bloc) => bloc.add(const CompanyInfoFetchDataEvent()),
      expect: () => [
        const CompanyInfoLoadingState(),
        const CompanyInfoLoadedState(companyInfo),
      ],
    );

    blocTest(
      'emits [CompanyInfoLoadingState, CompanyInfoErrorState] when getCompanyInfo throws an HttpException',
      build: () => CompanyInfoBloc(companyInfoService),
      act: (bloc) {
        when(companyInfoService.getCompanyInfo()).thenThrow(
          const CustomHttpException(message: 'Http error'),
        );
        bloc.add(const CompanyInfoFetchDataEvent());
      },
      expect: () => [
        const CompanyInfoLoadingState(),
        const CompanyInfoErrorState('Http error'),
      ],
    );

    blocTest(
      'emits [CompanyInfoLoadingState, CompanyInfoErrorState] when getCompanyInfo throws an Exception',
      build: () => CompanyInfoBloc(companyInfoService),
      act: (bloc) {
        when(companyInfoService.getCompanyInfo()).thenThrow(
          const CustomHttpException(message: 'Error'),
        );
        bloc.add(const CompanyInfoFetchDataEvent());
      },
      expect: () => [
        const CompanyInfoLoadingState(),
        const CompanyInfoErrorState('Error'),
      ],
    );

    blocTest(
      'calls openWebPage with correct URL when CompanyInfoOpenWebPageEvent is added',
      build: () => CompanyInfoBloc(companyInfoService),
      act: (bloc) => bloc.add(const CompanyInfoOpenWebPageEvent('test.com')),
      verify: (_) {
        verify(companyInfoService.openWebPage('test.com')).called(1);
      },
    );
  });
}
