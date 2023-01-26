import 'package:applifting_assignment/app/launch/domain/launch.dart';

abstract class ILaunchService {
  Future<List<Launch>> getUpcomingLaunches();
  Future<List<Launch>> getPastLaunches();
}
