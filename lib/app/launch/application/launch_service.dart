import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';
import 'package:applifting_assignment/app/launch/domain/crew.dart';
import 'package:applifting_assignment/app/launch/domain/failure.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:remove_diacritic/remove_diacritic.dart';

class LaunchService implements ILaunchService {
  final ILaunchRepository launchRepository;

  const LaunchService(this.launchRepository);

  @override
  Future<List<Launch>> getUpcomingLaunches() async {
    final upcomingLaunches = await launchRepository.fetchUpcomingLaunches();
    return _getLaunchesFromLauchesDTOs(upcomingLaunches);
  }

  @override
  Future<List<Launch>> getPastLaunches() async {
    final pastLaunches = await launchRepository.fetchPastLaunches();
    return _getLaunchesFromLauchesDTOs(pastLaunches);
  }

  @override
  List<Launch> search({
    required List<Launch> launches,
    required String filter,
  }) {
    filter = removeDiacritics(filter.toLowerCase());
    return launches
        .where((element) =>
            removeDiacritics(element.name.toLowerCase()).contains(filter) ||
            removeDiacritics(element.id..toLowerCase()).contains(filter) ||
            (element.rocket != null
                ? (removeDiacritics(element.rocket!.toLowerCase()).contains(filter))
                : false))
        .toList();
  }

  List<Launch> _getLaunchesFromLauchesDTOs(List<LaunchDTO> launches) => launches
      .map((launch) => Launch(
            failures: launch.failures
                .map((failure) => Failure(
                      time: failure.time,
                      altitude: failure.altitude,
                      reason: failure.reason,
                    ))
                .toList(),
            crew: launch.crew
                .map((c) => Crew(
                      crew: c.crew,
                      role: c.role,
                    ))
                .toList(),
            ships: launch.ships,
            capsules: launch.capsules,
            payloads: launch.payloads,
            name: launch.name,
            date: launch.date,
            id: launch.id,
            details: launch.details,
            flightNumber: launch.flightNumber,
            launchpad: launch.launchpad,
            rocket: launch.rocket,
            success: launch.success,
          ))
      .toList();
}
