import 'package:applifting_assignment/app/launch/domain/filter.dart';
import 'package:applifting_assignment/app/launch/domain/launch.dart';

abstract class ILaunchService {
  Future<List<Launch>> getUpcomingLaunches();
  Future<List<Launch>> getPastLaunches();
  List<Launch> search({
    required List<Launch> launches,
    required String search,
  });
  List<Launch> sortLaunches({
    required List<Launch> launches,
    required Filter filter,
  });
  Future<Filter> getLaunchFilter();
  String formatDate(DateTime dateTime);
}
