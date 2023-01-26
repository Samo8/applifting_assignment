part of 'launch_bloc.dart';

abstract class LaunchState extends Equatable {
  const LaunchState();

  @override
  List<Object> get props => [];
}

class LaunchInitial extends LaunchState {
  const LaunchInitial();
}

class LaunchLoadingState extends LaunchState {
  const LaunchLoadingState();
}

class LaunchLoadedState extends LaunchState {
  final List<Launch> upcomingLaunches;
  final List<Launch> pastLaunches;

  const LaunchLoadedState({
    required this.upcomingLaunches,
    required this.pastLaunches,
  });

  @override
  List<Object> get props => [upcomingLaunches, pastLaunches];
}

class LaunchErrorState extends LaunchState {
  final String error;

  const LaunchErrorState(this.error);

  @override
  List<Object> get props => [error];
}
