import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';

abstract class ICompanyInfoRepository {
  Future<CompanyInfoDTO> fetchCompanyInfo();
}
