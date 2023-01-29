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
  final String search;

  const LaunchSearchEvent(this.search);

  @override
  List<Object> get props => [search];
}

class LaunchClearSearchEvent extends LaunchEvent {
  const LaunchClearSearchEvent();
}

class LaunchSortByLaunchIdEvent extends LaunchEvent {
  final bool descending;

  const LaunchSortByLaunchIdEvent({
    this.descending = false,
  });

  @override
  List<Object> get props => [descending];
}

class LaunchSortByLaunchDateEvent extends LaunchEvent {
  final bool descending;

  const LaunchSortByLaunchDateEvent({
    this.descending = false,
  });

  @override
  List<Object> get props => [descending];
}

class LaunchUpdateDescendingSortEvent extends LaunchEvent {
  const LaunchUpdateDescendingSortEvent();
}
