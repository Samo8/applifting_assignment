import 'package:applifting_assignment/app/launch/data/dto/launch_filter_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';

abstract class ILaunchRepository {
  Future<List<LaunchDTO>> fetchUpcomingLaunches();
  Future<List<LaunchDTO>> fetchPastLaunches();
  Future<LaunchFilterDTO?> fetchLaunchFilter();
  Future<void> persistLaunchFilter(LaunchFilterDTO filter);
}
