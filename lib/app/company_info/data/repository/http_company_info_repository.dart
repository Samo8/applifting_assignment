import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:http/http.dart' as http;

import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository.dart';

class HttpCompanyInfoRepository implements CompanyInfoRepository {
  final http.Client client;

  HttpCompanyInfoRepository({
    required this.client,
  });

  @override
  Future<CompanyInfoDTO> fetchCompanyInfo() async {
    // TODO: implement fetchCompanyInfo
    throw UnimplementedError();
  }
}
