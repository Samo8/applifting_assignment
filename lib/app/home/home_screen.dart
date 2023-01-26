import 'package:applifting_assignment/app/company_info/presentation/company_info_screen.dart';
import 'package:applifting_assignment/app/home/bloc/home_bloc.dart';
import 'package:applifting_assignment/app/home/enums/bottom_nav_bar_item.dart';
import 'package:applifting_assignment/app/launch/presentation/launch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Applifting SpaceX',
            ),
          ),
          body: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeStateCompanyInfo) {
                return const CompanyInfoScreen();
              } else {
                return const LaunchScreen();
              }
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: 'Info',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.rocket),
                label: 'Launches',
              ),
            ],
            currentIndex: state.bottomNavBarItem.index,
            onTap: (int index) {
              final homeBloc = context.read<HomeBloc>();
              final selectedItem = BottomNavBarItem.values[index];

              if (selectedItem == BottomNavBarItem.companyInfo) {
                homeBloc.add(const HomeCompanyInfoEvent());
              } else {
                homeBloc.add(const HomeLaunchesEvent());
              }
            },
          ),
        );
      },
    );
  }
}
