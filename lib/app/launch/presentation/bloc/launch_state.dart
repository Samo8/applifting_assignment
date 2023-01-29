part of 'launch_bloc.dart';

class LaunchState extends Equatable {
  final List<Launch> upcomingLaunchesUnfiltered;
  final List<Launch> pastLaunchesUnfiltered;
  final List<Launch> upcomingLaunches;
  final List<Launch> pastLaunches;
  final bool isLoading;
  final String error;
  final String filter;

  const LaunchState({
    this.upcomingLaunchesUnfiltered = const [],
    this.pastLaunchesUnfiltered = const [],
    this.upcomingLaunches = const [],
    this.pastLaunches = const [],
    this.isLoading = false,
    this.error = '',
    this.filter = '',
  });

  LaunchState copyWith({
    List<Launch>? upcomingLaunchesUnfiltered,
    List<Launch>? pastLaunchesUnfiltered,
    List<Launch>? upcomingLaunches,
    List<Launch>? pastLaunches,
    bool? isLoading,
    String? error,
    String? filter,
  }) {
    return LaunchState(
      upcomingLaunchesUnfiltered: upcomingLaunchesUnfiltered ?? this.upcomingLaunchesUnfiltered,
      pastLaunchesUnfiltered: pastLaunchesUnfiltered ?? this.pastLaunchesUnfiltered,
      upcomingLaunches: upcomingLaunches ?? this.upcomingLaunches,
      pastLaunches: pastLaunches ?? this.pastLaunches,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [
        upcomingLaunchesUnfiltered,
        pastLaunchesUnfiltered,
        upcomingLaunches,
        pastLaunches,
        isLoading,
        error,
        filter
      ];
}
