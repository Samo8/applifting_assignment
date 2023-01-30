import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:applifting_assignment/app/launch/domain/filter.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/exception/http_exception.dart';
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
          launchesService.getLaunchFilter(),
        ]);
        final upcomingLaunches = data[0] as List<Launch>;
        final pastLaunches = data[1] as List<Launch>;
        final filter = data[2] as Filter;

        emit(
          state.copyWith(
            upcomingLaunchesUnfiltered: upcomingLaunches,
            pastLaunchesUnfiltered: pastLaunches,
            upcomingLaunches: _sortLaunches(
              launches: upcomingLaunches,
              filter: filter,
              search: state.search,
            ),
            pastLaunches: _sortLaunches(
              launches: pastLaunches,
              filter: filter,
              search: state.search,
            ),
            filter: filter,
            isLoading: false,
            error: '',
          ),
        );
      } on CustomHttpException catch (e) {
        emit(
          state.copyWith(
            isLoading: false,
            error: e.message,
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
      final search = event.search;

      emit(
        state.copyWith(
          upcomingLaunches: _sortLaunches(
            launches: state.upcomingLaunchesUnfiltered,
            filter: state.filter,
            search: search,
          ),
          pastLaunches: _sortLaunches(
            launches: state.pastLaunchesUnfiltered,
            filter: state.filter,
            search: search,
          ),
          search: search,
        ),
      );
    });
    on<LaunchSortByLaunchIdEvent>((event, emit) {
      final filter = state.filter?.copyWith(
            filterBy: FilterBy.id,
            isDescending: event.descending,
          ) ??
          Filter(
            filterBy: FilterBy.id,
            isDescending: event.descending,
          );

      final upcomingLaunches = _sortLaunches(
        launches: state.upcomingLaunchesUnfiltered,
        filter: filter,
        search: state.search,
      );
      final pastLaunches = _sortLaunches(
        launches: state.pastLaunchesUnfiltered,
        filter: filter,
        search: state.search,
      );

      emit(
        state.copyWith(
          upcomingLaunches: upcomingLaunches,
          pastLaunches: pastLaunches,
          filter: filter,
        ),
      );
    });
    on<LaunchSortByLaunchDateEvent>((event, emit) {
      final filter = state.filter?.copyWith(
            filterBy: FilterBy.date,
            isDescending: event.descending,
          ) ??
          Filter(
            filterBy: FilterBy.date,
            isDescending: event.descending,
          );
      final upcomingLaunches = _sortLaunches(
        launches: state.upcomingLaunchesUnfiltered,
        filter: filter,
        search: state.search,
      );
      final pastLaunches = _sortLaunches(
        launches: state.pastLaunchesUnfiltered,
        filter: filter,
        search: state.search,
      );

      emit(
        state.copyWith(
          upcomingLaunches: upcomingLaunches,
          pastLaunches: pastLaunches,
          filter: filter,
        ),
      );
    });
    on<LaunchUpdateDescendingSortEvent>((event, emit) {
      final filter = state.filter;

      if (filter != null) {
        if (filter.filterBy == FilterBy.id) {
          add(
            LaunchSortByLaunchIdEvent(
              descending: !filter.isDescending,
            ),
          );
        } else if (filter.filterBy == FilterBy.date) {
          add(
            LaunchSortByLaunchDateEvent(
              descending: !filter.isDescending,
            ),
          );
        }
      }
    });
    on<LaunchClearSearchEvent>(
      (_, emit) => emit(
        state.copyWith(
          upcomingLaunches: state.filter != null
              ? launchesService.sortLaunches(
                  launches: state.upcomingLaunchesUnfiltered,
                  filter: state.filter!,
                )
              : state.upcomingLaunchesUnfiltered,
          pastLaunches: state.filter != null
              ? launchesService.sortLaunches(
                  launches: state.pastLaunchesUnfiltered,
                  filter: state.filter!,
                )
              : state.pastLaunchesUnfiltered,
          search: '',
        ),
      ),
    );
  }
  List<Launch> _applySearch({
    required List<Launch> launches,
    required String search,
  }) {
    return search.isEmpty
        ? launches
        : launchesService.search(
            launches: launches,
            search: search,
          );
  }

  List<Launch> _sortLaunches({
    required List<Launch> launches,
    required Filter? filter,
    required String search,
  }) {
    final launchesWithAppliedSearch = _applySearch(
      launches: launches,
      search: search,
    );
    if (filter != null) {
      return launchesService.sortLaunches(
        launches: launchesWithAppliedSearch,
        filter: filter,
      );
    }
    return launchesWithAppliedSearch;
  }
}
