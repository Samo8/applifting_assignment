import 'package:applifting_assignment/app/launches/domain/launch.dart';

abstract class ILaunchesService {
  Future<List<Launch>> getUpcomingLaunches();
  Future<List<Launch>> getPastLaunches();
}
