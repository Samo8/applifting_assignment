import 'package:applifting_assignment/app/company_info/application/company_info_service.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_local_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/datasources/company_info_remote_datasource.dart';
import 'package:applifting_assignment/app/company_info/data/repository/company_info_repository.dart';
import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/app/home/bloc/home_bloc.dart';
import 'package:applifting_assignment/app/home/home_screen.dart';
import 'package:applifting_assignment/core/network_info.dart';
import 'package:applifting_assignment/http/custom_http_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    AppliftingApp(
      prefs: prefs,
    ),
  );
}

class AppliftingApp extends StatelessWidget {
  final SharedPreferences prefs;

  const AppliftingApp({
    required this.prefs,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final client = CustomHttpClient(
      client: http.Client(),
      baseUrl: 'https://api.spacexdata.com',
    );

    final remoteDataSource = CompanyInfoRemoteDataScoure(client);
    final localDataSource = CompanyInfoLocalDataSource(prefs);
    final networkInfo = NetworkInfo();

    final companyInfoRepository = CompanyInfoRepository(
      remoteDataSource: remoteDataSource,
      localDataSource: localDataSource,
      networkInfo: networkInfo,
    );
    final companyInfoService = CompanyInfoService(companyInfoRepository);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => CompanyInfoBloc(companyInfoService),
        ),
      ],
      child: MaterialApp(
        title: 'Applifting SpaceX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
