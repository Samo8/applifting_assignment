import 'dart:io';

import 'package:applifting_assignment/app/launch/application/launch_service_interface.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';
import 'package:applifting_assignment/app/launch/domain/links.dart';
import 'package:applifting_assignment/app/launch/domain/patch.dart';
import 'package:applifting_assignment/app/launch/presentation/bloc/launch_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'launch_bloc_test.mocks.dart';

class MockLaunchService extends Mock implements ILaunchService {}

@GenerateMocks([MockLaunchService])
void main() {
  final launchService = MockMockLaunchService();

  group('LaunchBloc', () {
    final launch = Launch(
      failures: const [],
      crew: const [],
      ships: const [],
      capsules: const [],
      payloads: const [],
      name: 'Launch',
      date: DateTime(2022, 10),
      id: 'afasaf241',
      links: const Links(patch: Patch()),
    );

    blocTest(
      'emits [LaunchLoading, LaunchLoadedWithData] when LaunchFetchDataEvent is added',
      build: () => LaunchBloc(launchService),
      act: (bloc) {
        when(launchService.getUpcomingLaunches()).thenAnswer((_) async => [launch]);
        when(launchService.getPastLaunches()).thenAnswer((_) async => [launch]);
        bloc.add(const LaunchFetchDataEvent());
      },
      verify: (bloc) => [
        bloc.state.isLoading,
        bloc.state.pastLaunchesUnfiltered.isNotEmpty,
        bloc.state.pastLaunches.isNotEmpty,
        bloc.state.upcomingLaunchesUnfiltered.isNotEmpty,
        bloc.state.upcomingLaunches.isNotEmpty,
        bloc.state.error.isEmpty,
      ],
    );

    blocTest(
      'emits [LaunchLoading, LaunchError] when getUpcomingLaunches throws an HttpException',
      build: () => LaunchBloc(launchService),
      act: (bloc) {
        when(launchService.getUpcomingLaunches()).thenThrow(const HttpException('Http error'));
        bloc.add(const LaunchFetchDataEvent());
      },
      verify: (bloc) => [
        bloc.state.isLoading,
        bloc.state.pastLaunchesUnfiltered.isEmpty,
        bloc.state.pastLaunches.isEmpty,
        bloc.state.upcomingLaunchesUnfiltered.isEmpty,
        bloc.state.upcomingLaunches.isEmpty,
        bloc.state.error.isNotEmpty,
      ],
    );

    blocTest(
      'emits [LaunchLoading, LaunchError] when getPastLaunches throws an HttpException',
      build: () => LaunchBloc(launchService),
      act: (bloc) {
        when(launchService.getPastLaunches()).thenThrow(const HttpException('Http error'));
        bloc.add(const LaunchFetchDataEvent());
      },
      verify: (bloc) => [
        bloc.state.isLoading,
        bloc.state.pastLaunchesUnfiltered.isEmpty,
        bloc.state.pastLaunches.isEmpty,
        bloc.state.upcomingLaunchesUnfiltered.isEmpty,
        bloc.state.upcomingLaunches.isEmpty,
        bloc.state.error.isNotEmpty,
      ],
    );
  });
}
