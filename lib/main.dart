import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/app/home/bloc/home_bloc.dart';
import 'package:applifting_assignment/app/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
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
          create: (_) => CompanyInfoBloc(),
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
