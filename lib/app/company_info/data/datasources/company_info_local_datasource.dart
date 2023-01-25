import 'dart:convert';

import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICompanyInfoLocalDataSource {
  Future<CompanyInfoDTO?> fetchCompanyInfo();
  Future<void> persistCompanyInfo(CompanyInfoDTO companyInfo);
}

class CompanyInfoLocalDataSource implements ICompanyInfoLocalDataSource {
  final SharedPreferences sharedPreferences;

  const CompanyInfoLocalDataSource(this.sharedPreferences);

  @override
  Future<CompanyInfoDTO?> fetchCompanyInfo() async {
    final companyInfo = sharedPreferences.getString('company_info');

    if (companyInfo != null) {
      return CompanyInfoDTO.fromJson(json.decode(companyInfo));
    }
    return null;
  }

  @override
  Future<void> persistCompanyInfo(CompanyInfoDTO companyInfo) async {
    await sharedPreferences.setString(
      'company_info',
      json.encode(companyInfo.toJson()),
    );
  }
}
