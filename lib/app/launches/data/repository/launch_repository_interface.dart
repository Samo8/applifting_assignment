import 'package:applifting_assignment/app/launches/data/dto/launch_dto.dart';

abstract class ILaunchRepository {
  Future<List<LaunchDTO>> fetchUpcomingLaunches();
  Future<List<LaunchDTO>> fetchPastLaunches();
}
