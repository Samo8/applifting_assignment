import 'package:applifting_assignment/app/company_info/application/company_info_service_interface.dart';
import 'package:applifting_assignment/app/company_info/presentation/bloc/company_info_bloc.dart';
import 'package:applifting_assignment/app/home/bloc/home_bloc.dart';
import 'package:applifting_assignment/app/home/home_screen.dart';
import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:applifting_assignment/app/launch/presentation/launch_detail_screen.dart';
import 'package:applifting_assignment/constants/custom_theme.dart';
import 'package:applifting_assignment/i18n/strings.g.dart';
import 'package:applifting_assignment/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await configureDependencies();

  runApp(
    TranslationProvider(
      child: const AppliftingApp(),
    ),
  );
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
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        home: const HomeScreen(),
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomeScreen.routeName:
              return MaterialPageRoute(
                settings: const RouteSettings(
                  name: HomeScreen.routeName,
                ),
                builder: (_) => const HomeScreen(),
              );
            case LaunchDetailScreen.routeName:
              final launchDetailScreenArgs = settings.arguments as LaunchDetailScreenArgs;

              return MaterialPageRoute(
                settings: const RouteSettings(
                  name: LaunchDetailScreen.routeName,
                ),
                builder: (_) => LaunchDetailScreen(
                  args: launchDetailScreenArgs,
                ),
              );
            default:
              return MaterialPageRoute(
                settings: const RouteSettings(
                  name: HomeScreen.routeName,
                ),
                builder: (_) => const HomeScreen(),
              );
          }
        },
      ),
    );
  }
}
