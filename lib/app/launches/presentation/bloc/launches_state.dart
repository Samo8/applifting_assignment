part of 'launches_bloc.dart';

abstract class LaunchesState extends Equatable {
  const LaunchesState();
  
  @override
  List<Object> get props => [];
}

class LaunchesInitial extends LaunchesState {}
