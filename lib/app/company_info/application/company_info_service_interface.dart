import 'package:applifting_assignment/app/company_info/domain/company_info.dart';

abstract class ICompanyInfoService {
  Future<CompanyInfo> getCompanyInfo();
  Future<void> openWebPage(String url);
}
