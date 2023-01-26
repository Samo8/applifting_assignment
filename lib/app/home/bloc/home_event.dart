part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeCompanyInfoEvent extends HomeEvent {
  const HomeCompanyInfoEvent();
}

class HomeLaunchesEvent extends HomeEvent {
  const HomeLaunchesEvent();
}

class HomeHistoryEvent extends HomeEvent {
  const HomeHistoryEvent();
}
