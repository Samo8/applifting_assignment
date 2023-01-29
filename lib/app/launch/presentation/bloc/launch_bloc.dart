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
            upcomingLaunches: _applySearch(launches: upcomingLaunches, filter: state.filter),
            pastLaunches: _applySearch(launches: pastLaunches, filter: state.filter),
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
      final filter = event.filter;

      emit(
        state.copyWith(
          upcomingLaunches: _applySearch(
            launches: state.upcomingLaunchesUnfiltered,
            filter: filter,
          ),
          pastLaunches: _applySearch(
            launches: state.pastLaunchesUnfiltered,
            filter: filter,
          ),
          filter: filter,
        ),
      );
    });
    on<LaunchClearSearchEvent>(
      (_, emit) => emit(
        state.copyWith(
          upcomingLaunches: state.upcomingLaunchesUnfiltered,
          pastLaunches: state.pastLaunchesUnfiltered,
          filter: '',
        ),
      ),
    );
  }
  List<Launch> _applySearch({
    required List<Launch> launches,
    required String filter,
  }) {
    return filter.isEmpty
        ? launches
        : launchesService.search(
            launches: launches,
            filter: filter,
          );
  }
}
