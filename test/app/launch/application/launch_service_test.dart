import 'package:applifting_assignment/app/launch/application/launch_service.dart';
import 'package:applifting_assignment/app/launch/data/dto/crew_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/failure_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/flickr_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/links_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/patch_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';
import 'package:applifting_assignment/app/launch/domain/crew.dart';
import 'package:applifting_assignment/app/launch/domain/failure.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/domain/links.dart';
import 'package:applifting_assignment/app/launch/domain/patch.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'launch_service_test.mocks.dart';

class MockLaunchRepository extends Mock implements ILaunchRepository {}

@GenerateMocks([MockLaunchRepository])
void main() {
  final ILaunchRepository mockLaunchRepository = MockMockLaunchRepository();
  final LaunchService service = LaunchService(mockLaunchRepository);

  final launchDTO = LaunchDTO(
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

  final launch = Launch(
    failures: const <Failure>[],
    crew: const <Crew>[],
    ships: const <String>[],
    capsules: const <String>[],
    payloads: const <String>[],
    name: 'Test Launch 1',
    date: DateTime(2022, 10, 10),
    id: '124124142352352fasdfasfas',
    links: const Links(
      patch: Patch(),
    ),
  );

  group('fetchUpcomingLaunches', () {
    test(
      'should return upcoming launches when remote data source returns data',
      () async {
        // arrange
        final launchesDTOs = [launchDTO];
        final launches = [launch];
        when(mockLaunchRepository.fetchUpcomingLaunches()).thenAnswer((_) async => launchesDTOs);

        // act
        final result = await service.getUpcomingLaunches();

        // assert
        verify(mockLaunchRepository.fetchUpcomingLaunches());
        expect(result, launches);
      },
    );
  });

  group('fetchPastLaunches', () {
    test(
      'should return past launches when remote data source returns data',
      () async {
        // arrange
        final launchesDTOs = [launchDTO];
        final launches = [launch];
        when(mockLaunchRepository.fetchPastLaunches()).thenAnswer((_) async => launchesDTOs);

        // act
        final result = await service.getPastLaunches();

        // assert
        verify(mockLaunchRepository.fetchPastLaunches());
        expect(result, launches);
      },
    );
  });
}
