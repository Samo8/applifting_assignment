part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final BottomNavBarItem bottomNavBarItem;

  const HomeState(this.bottomNavBarItem);

  @override
  List<Object> get props => [bottomNavBarItem];
}

class HomeStateCompanyInfo extends HomeState {
  const HomeStateCompanyInfo(super.bottomNavBarItem);
}

class HomeStateLaunches extends HomeState {
  const HomeStateLaunches(super.bottomNavBarItem);
}
