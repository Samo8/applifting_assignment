part of 'launch_bloc.dart';

abstract class LaunchEvent extends Equatable {
  const LaunchEvent();

  @override
  List<Object> get props => [];
}

class LaunchFetchDataEvent extends LaunchEvent {
  const LaunchFetchDataEvent();
}
