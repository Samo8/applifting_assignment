import 'package:applifting_assignment/app/launches/application/launches_service_interface.dart';
import 'package:applifting_assignment/app/launches/domain/launch.dart';

class LaunchService implements ILaunchesService {
  @override
  Future<List<Launch>> getPastLaunches() {
    // TODO: implement getPastLaunches
    throw UnimplementedError();
  }

  @override
  Future<List<Launch>> getUpcomingLaunches() {
    // TODO: implement getUpcomingLaunches
    throw UnimplementedError();
  }
}
