import 'package:applifting_assignment/app/company_info/application/company_info_service.dart';
import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:applifting_assignment/app/company_info/data/dto/headquarters_dto.dart';
import 'package:applifting_assignment/app/company_info/data/dto/links_dto.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'company_info_service_test.mocks.dart';

@GenerateMocks([MockCompanyInfoRepository])
class MockCompanyInfoRepository extends Mock implements ICompanyInfoRepository {}

void main() {
  final mockCompanyInfoRepository = MockMockCompanyInfoRepository();

  final ICompanyInfoService companyInfoService = CompanyInfoService(mockCompanyInfoRepository);

  const companyInfoDTO = CompanyInfoDTO(
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

  test('getCompanyInfo should return a CompanyInfo object', () async {
    when(mockCompanyInfoRepository.fetchCompanyInfo()).thenAnswer(
      (_) => Future.value(companyInfoDTO),
    );

    final companyInfo = await companyInfoService.getCompanyInfo();

    expect(companyInfo.name, companyInfoDTO.name);
    expect(companyInfo.headquarters.address, companyInfoDTO.headquarters.address);
    expect(companyInfo.headquarters.city, companyInfoDTO.headquarters.city);
    expect(companyInfo.headquarters.state, companyInfoDTO.headquarters.state);
    expect(companyInfo.links.website, companyInfoDTO.links.website);
    expect(companyInfo.links.twitter, companyInfoDTO.links.twitter);
    expect(companyInfo.founded, companyInfoDTO.founded);
    expect(companyInfo.employees, companyInfoDTO.employees);
    expect(companyInfo.ceo, companyInfoDTO.ceo);
    expect(companyInfo.cto, companyInfoDTO.cto);
    expect(companyInfo.valuation, companyInfoDTO.valuation);
    expect(companyInfo.summary, companyInfoDTO.summary);
  });
}
