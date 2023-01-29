import 'package:applifting_assignment/app/home/enums/bottom_nav_bar_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeStateCompanyInfo(BottomNavBarItem.companyInfo)) {
    on<HomeCompanyInfoEvent>(
      (_, emit) => emit(
        const HomeStateCompanyInfo(BottomNavBarItem.companyInfo),
      ),
    );
    on<HomeLaunchesEvent>(
      (_, emit) => emit(
        const HomeStateLaunches(BottomNavBarItem.launches),
      ),
    );
  }
}
