import 'package:applifting_assignment/app/company_info/data/datasources/company_info_local_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_remote_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/dto/company_info_dto.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository_interface.dart';
import 'package:applifting_assignment/core/network_info.dart';
import 'package:applifting_assignment/exception/http_exception.dart';

class CompanyInfoRepository implements ICompanyInfoRepository {
  final ICompanyInfoRemoteDataSource remoteDataSource;
  final ICompanyInfoLocalDataSource localDataSource;
  final INetworkInfo networkInfo;

  CompanyInfoRepository({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<CompanyInfoDTO> fetchCompanyInfo() async {
    final isInternetConnectionAvailable = await networkInfo.isInternetConnectionAvailable();

    if (isInternetConnectionAvailable) {
      final companyInfo = await remoteDataSource.fetchCompanyInfo();
      localDataSource.persistCompanyInfo(companyInfo);

      return companyInfo;
    } else {
      final companyInfo = await localDataSource.fetchCompanyInfo();
      if (companyInfo != null) {
        return companyInfo;
      }
      throw const HttpException('No internet connection');
    }
  }
}
