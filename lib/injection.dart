import 'package:applifting_assignment/app/company_info/application/company_info_service.dart';
import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_local_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_remote_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository_interface.dart';
import 'package:applifting_assignment/app/launch/application/launch_service.dart';
import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/data/datasource/launch_local_filter_datasource.dart';
import 'package:applifting_assignment/app/launch/data/datasource/launch_remote_datasource.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';
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

  final prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<ICompanyInfoRepository>(
    () => CompanyInfoRepository(
      remoteDataSource: CompanyInfoRemoteDataScoure(
        locator<IHttpClient>(),
      ),
      localDataSource: CompanyInfoLocalDataSource(prefs),
      networkInfo: NetworkInfo(),
    ),
  );
  locator.registerLazySingleton<ICompanyInfoService>(
    () => CompanyInfoService(locator<ICompanyInfoRepository>()),
  );

  locator.registerLazySingleton<ILaunchRepository>(
    () => LaunchRepository(
      launchRemoteDatasource: LaunchRemoteDataSource(
        locator<IHttpClient>(),
      ),
      launchLocalFilterDatasource: LaunchLocalFilterDatasource(prefs),
    ),
  );
  locator.registerLazySingleton<ILaunchService>(
    () => LaunchService(
      locator<ILaunchRepository>(),
    ),
  );
}
