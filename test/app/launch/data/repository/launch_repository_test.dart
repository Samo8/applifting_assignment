import 'package:applifting_assignment/app/launch/data/datasource/launch_local_filter_datasource.dart';
import 'package:applifting_assignment/app/launch/data/datasource/launch_remote_datasource.dart';
import 'package:applifting_assignment/app/launch/data/dto/crew_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/failure_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/flickr_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_filter_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/links_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/patch_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository.dart';
import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:applifting_assignment/exception/http_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'launch_repository_test.mocks.dart';

class MockLaunchRemoteDatasource extends Mock implements ILaunchRemoteDatasource {}

class MockLaunchLocalFilterDatasource extends Mock implements ILaunchLocalFilterDatasource {}

@GenerateMocks([MockLaunchRemoteDatasource, MockLaunchLocalFilterDatasource])
void main() {
  final remoteDatasource = MockMockLaunchRemoteDatasource();
  final launchLocalFilterDatasource = MockMockLaunchLocalFilterDatasource();
  final LaunchRepository launchRepository = LaunchRepository(
    launchRemoteDatasource: remoteDatasource,
    launchLocalFilterDatasource: launchLocalFilterDatasource,
  );

  final LaunchDTO launchDTO1 = LaunchDTO(
    failures: const <FailureDTO>[],
    crew: const <CrewDTO>[],
    ships: const <String>[],
    capsules: const <String>[],
    payloads: const <String>[],
    name: 'Test Launch 1',
    date: DateTime(2022, 10, 10),
    id: '124124142352352fasdfasfas',
    links: const LinksDTO(
      patch: PatchDTO(),
      flickr: FlickrDTO(
        small: [],
        original: [],
      ),
    ),
  );
  final LaunchDTO launchDTO2 = LaunchDTO(
    failures: const <FailureDTO>[],
    crew: const <CrewDTO>[],
    ships: const <String>[],
    capsules: const <String>[],
    payloads: const <String>[],
    name: 'Test Launch 2',
    date: DateTime(2022, 10, 10),
    id: '124124142352352fasdfasfas',
    links: const LinksDTO(
      patch: PatchDTO(),
      flickr: FlickrDTO(
        small: [],
        original: [],
      ),
    ),
  );

  group('fetchUpcomingsLaunches', () {
    test('fetchUpcomingLaunches returns launches from remote data source', () async {
      when(remoteDatasource.fetchUpcomingLaunches())
          .thenAnswer((_) async => [launchDTO1, launchDTO2]);

      final launches = await launchRepository.fetchUpcomingLaunches();
      expect(launches, isA<List<LaunchDTO>>());
      expect(launches.length, 2);
      expect(launches[0].name, 'Test Launch 1');
      expect(launches[1].name, 'Test Launch 2');
    });

    test('should throw exception when fetchUpcomingLaunches is unsuccessful', () async {
      when(remoteDatasource.fetchUpcomingLaunches())
          .thenThrow(const HttpException('Could not fetch upcoming launches'));
      expect(
        launchRepository.fetchUpcomingLaunches(),
        throwsA(isA<HttpException>()
            .having((e) => e.message, 'message', 'Could not fetch upcoming launches')),
      );
    });
  });

  group('fetchPastLaunches', () {
    test('fetchPastLaunches returns launches from remote data source', () async {
      when(remoteDatasource.fetchPastLaunches()).thenAnswer((_) async => [launchDTO1, launchDTO2]);

      final launches = await launchRepository.fetchPastLaunches();
      expect(launches, isA<List<LaunchDTO>>());
      expect(launches.length, 2);
      expect(launches[0].name, 'Test Launch 1');
      expect(launches[1].name, 'Test Launch 2');
    });

    test('should throw exception when fetchPastLaunches is unsuccessful', () async {
      when(remoteDatasource.fetchPastLaunches())
          .thenThrow(const HttpException('Could not fetch past launches'));
      expect(
        launchRepository.fetchPastLaunches(),
        throwsA(isA<HttpException>()
            .having((e) => e.message, 'message', 'Could not fetch past launches')),
      );
    });
  });

  test('fetchUpcomingLaunches returns launches from remote data source', () async {
    const filterDTO = LaunchFilterDTO(
      filterBy: FilterBy.id,
      isDescending: false,
    );
    when(launchLocalFilterDatasource.fetchFilter()).thenAnswer((_) async => filterDTO);

    final filter = await launchRepository.fetchLaunchFilter();

    expect(filter, isA<LaunchFilterDTO>());
    expect(filter?.filterBy, filterDTO.filterBy);
    expect(filter?.isDescending, filterDTO.isDescending);
  });
}
