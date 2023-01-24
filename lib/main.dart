import 'package:applifting_assignment/app/company_info/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/app/company_info/company_info_screen.dart';
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
          create: (_) => CompanyInfoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Applifting SpaceX',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CompanyInfoScreen(),
      ),
    );
  }
}
