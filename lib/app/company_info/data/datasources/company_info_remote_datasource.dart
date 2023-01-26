import 'dart:convert';

import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:applifting_assignment/http/http_client_interface.dart';

abstract class ICompanyInfoRemoteDataSource {
  Future<CompanyInfoDTO> fetchCompanyInfo();
}

class CompanyInfoRemoteDataScoure implements ICompanyInfoRemoteDataSource {
  final IHttpClient client;

  const CompanyInfoRemoteDataScoure(this.client);

  @override
  Future<CompanyInfoDTO> fetchCompanyInfo() async {
    final response = await client.get('v4/company');

    final decodedResponse = json.decode(response.body);
    return CompanyInfoDTO.fromJson(decodedResponse as Map<String, dynamic>);
  }
}
