import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_filter_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';
import 'package:applifting_assignment/app/launch/domain/crew.dart';
import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:applifting_assignment/app/launch/domain/failure.dart';
import 'package:applifting_assignment/app/launch/domain/filter.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/domain/links.dart';
import 'package:applifting_assignment/app/launch/domain/patch.dart';
import 'package:intl/intl.dart';
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
    required String search,
  }) {
    search = removeDiacritics(search.toLowerCase());
    int? searchYear = int.tryParse(search);

    return launches
        .where((element) =>
            removeDiacritics(element.name.toLowerCase()).contains(search) ||
            removeDiacritics(element.id..toLowerCase()).contains(search) ||
            (element.rocket != null
                ? (removeDiacritics(element.rocket!.toLowerCase()).contains(search))
                : false) ||
            (searchYear != null && searchYear == element.date.year))
        .toList();
  }

  List<Launch> _getLaunchesFromLauchesDTOs(List<LaunchDTO> launches) => launches
      .map(
        (launch) => Launch(
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
          links: Links(
            patch: Patch(
              small: launch.links.patch.small,
            ),
          ),
        ),
      )
      .toList();

  @override
  Future<Filter> getLaunchFilter() async {
    final launchFilterDTO = await launchRepository.fetchLaunchFilter();
    if (launchFilterDTO != null) {
      return Filter(
        filterBy: launchFilterDTO.filterBy,
        isDescending: launchFilterDTO.isDescending,
      );
    }
    return const Filter.base();
  }

  @override
  String formatDate(DateTime dateTime) {
    final dateFormat = DateFormat('dd.MM.yyyy HH:mm');
    return dateFormat.format(dateTime);
  }

  @override
  List<Launch> sortLaunches({
    required List<Launch> launches,
    required Filter filter,
  }) {
    int compare(Launch a, Launch b) {
      switch (filter.filterBy) {
        case FilterBy.id:
          return filter.isDescending ? b.id.compareTo(a.id) : a.id.compareTo(b.id);
        case FilterBy.date:
          return filter.isDescending ? b.date.compareTo(a.date) : a.date.compareTo(b.date);
        default:
          return 0;
      }
    }

    launchRepository.persistLaunchFilter(
      LaunchFilterDTO(
        filterBy: filter.filterBy,
        isDescending: filter.isDescending,
      ),
    );

    return [...launches]..sort(compare);
  }
}
