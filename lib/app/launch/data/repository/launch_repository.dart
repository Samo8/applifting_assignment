import 'package:applifting_assignment/app/launch/data/datasource/launch_local_filter_datasource.dart';
import 'package:applifting_assignment/app/launch/data/datasource/launch_remote_datasource.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_filter_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';

class LaunchRepository implements ILaunchRepository {
  final ILaunchRemoteDatasource launchRemoteDatasource;
  final ILaunchLocalFilterDatasource launchLocalFilterDatasource;

  const LaunchRepository({
    required this.launchRemoteDatasource,
    required this.launchLocalFilterDatasource,
  });

  @override
  Future<List<LaunchDTO>> fetchUpcomingLaunches() async {
    return await launchRemoteDatasource.fetchUpcomingLaunches();
  }

  @override
  Future<List<LaunchDTO>> fetchPastLaunches() async {
    return await launchRemoteDatasource.fetchPastLaunches();
  }

  @override
  Future<LaunchFilterDTO?> fetchLaunchFilter() async {
    return await launchLocalFilterDatasource.fetchFilter();
  }

  @override
  Future<void> persistLaunchFilter(LaunchFilterDTO filter) async {
    await launchLocalFilterDatasource.persistFilter(filter);
  }
}
