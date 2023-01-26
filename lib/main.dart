import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/app/home/bloc/home_bloc.dart';
import 'package:applifting_assignment/app/home/home_screen.dart';
import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:applifting_assignment/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(const AppliftingApp());
}

class AppliftingApp extends StatelessWidget {
  const AppliftingApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
        BlocProvider(
          create: (_) => CompanyInfoBloc(
            locator<ICompanyInfoService>(),
          ),
        ),
        BlocProvider(
          create: (_) => LaunchBloc(
            locator<ILaunchService>(),
          ),
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
