import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final ILaunchService launchesService;

  LaunchBloc(this.launchesService) : super(const LaunchState()) {
    on<LaunchFetchDataEvent>((event, emit) async {
      emit(
        state.copyWith(isLoading: true),
      );

      try {
        final data = await Future.wait([
          launchesService.getUpcomingLaunches(),
          launchesService.getPastLaunches(),
        ]);
        final upcomingLaunches = data[0];
        final pastLaunches = data[1];

        emit(
          state.copyWith(
            upcomingLaunchesUnfiltered: upcomingLaunches,
            pastLaunchesUnfiltered: pastLaunches,
            upcomingLaunches: upcomingLaunches,
            pastLaunches: pastLaunches,
            isLoading: false,
            error: '',
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: e.toString(),
          ),
        );
      }
    });
    on<LaunchSearchEvent>((event, emit) {
      emit(
        state.copyWith(
          upcomingLaunches: event.filter.isEmpty
              ? state.upcomingLaunches
              : launchesService.search(
                  launches: state.upcomingLaunchesUnfiltered,
                  filter: event.filter,
                ),
          pastLaunches: event.filter.isEmpty
              ? state.pastLaunchesUnfiltered
              : launchesService.search(
                  launches: state.pastLaunchesUnfiltered,
                  filter: event.filter,
                ),
        ),
      );
    });
  }
}
