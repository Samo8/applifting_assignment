import 'package:applifting_assignment/app/company_info/application/company_info_service.dart';
import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_local_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_remote_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository_interface.dart';
import 'package:applifting_assignment/core/network_info.dart';
import 'package:applifting_assignment/http/custom_http_client.dart';
import 'package:applifting_assignment/http/http_client_interface.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> configureDependencies() async {
  locator.registerLazySingleton<IHttpClient>(
    () => CustomHttpClient(
      client: http.Client(),
      baseUrl: 'https://api.spacexdata.com',
    ),
  );

  locator.registerLazySingleton<ICompanyInfoRemoteDataSource>(
    () => CompanyInfoRemoteDataScoure(
      locator<IHttpClient>(),
    ),
  );
  final prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<ICompanyInfoLocalDataSource>(
    () => CompanyInfoLocalDataSource(prefs),
  );
  locator.registerLazySingleton<INetworkInfo>(
    () => NetworkInfo(),
  );

  locator.registerLazySingleton<ICompanyInfoRepository>(
    () => CompanyInfoRepository(
      remoteDataSource: locator<ICompanyInfoRemoteDataSource>(),
      localDataSource: locator<ICompanyInfoLocalDataSource>(),
      networkInfo: locator<INetworkInfo>(),
    ),
  );

  locator.registerLazySingleton<ICompanyInfoService>(
    () => CompanyInfoService(locator<ICompanyInfoRepository>()),
  );
}
