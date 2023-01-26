import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'launch_event.dart';
part 'launch_state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  final ILaunchService launchesService;

  LaunchBloc(this.launchesService) : super(const LaunchInitial()) {
    on<LaunchFetchDataEvent>((event, emit) async {
      emit(const LaunchLoadingState());

      try {
        final data = await Future.wait([
          launchesService.getUpcomingLaunches(),
          launchesService.getPastLaunches(),
        ]);
        final upcomingLaunches = data[0];
        final pastLaunches = data[1];

        emit(
          LaunchLoadedState(
            upcomingLaunches: upcomingLaunches,
            pastLaunches: pastLaunches,
          ),
        );
      } catch (e) {
        emit(LaunchErrorState(e.toString()));
      }
    });
  }
}
