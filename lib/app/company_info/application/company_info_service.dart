import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository_interface.dart';
import 'package:applifting_assignment/app/company_info/domain/company_info.dart';
import 'package:applifting_assignment/app/company_info/domain/headquarters.dart';
import 'package:applifting_assignment/app/company_info/domain/links.dart';
import 'package:url_launcher/url_launcher.dart';

class CompanyInfoService implements ICompanyInfoService {
  final ICompanyInfoRepository companyInfoRepository;

  const CompanyInfoService(this.companyInfoRepository);

  @override
  Future<CompanyInfo> getCompanyInfo() async {
    final companyInfoDTO = await companyInfoRepository.fetchCompanyInfo();

    final headquartersDTO = companyInfoDTO.headquarters;
    final linksDTO = companyInfoDTO.links;

    return CompanyInfo(
      headquarters: Headquarters(
        address: headquartersDTO.address,
        city: headquartersDTO.city,
        state: headquartersDTO.state,
      ),
      links: Links(
        website: linksDTO.website,
        twitter: linksDTO.twitter,
      ),
      name: companyInfoDTO.name,
      founded: companyInfoDTO.founded,
      employees: companyInfoDTO.employees,
      vehicles: companyInfoDTO.vehicles,
      launchSites: companyInfoDTO.launchSites,
      testSites: companyInfoDTO.testSites,
      ceo: companyInfoDTO.ceo,
      cto: companyInfoDTO.cto,
      valuation: companyInfoDTO.valuation,
      summary: companyInfoDTO.summary,
    );
  }

  @override
  Future<void> openWebPage(String url) async {
    await launchUrl(Uri.parse(url));
  }
}
