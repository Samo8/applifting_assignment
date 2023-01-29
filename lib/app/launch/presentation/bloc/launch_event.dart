part of 'launch_bloc.dart';

abstract class LaunchEvent extends Equatable {
  const LaunchEvent();

  @override
  List<Object> get props => [];
}

class LaunchFetchDataEvent extends LaunchEvent {
  const LaunchFetchDataEvent();
}

class LaunchSearchEvent extends LaunchEvent {
  final String filter;

  const LaunchSearchEvent(this.filter);
  @override
  List<Object> get props => [filter];
}

class LaunchClearSearchEvent extends LaunchEvent {
  const LaunchClearSearchEvent();
}
