import 'dart:convert';

import 'package:applifting_assignment/app/launch/data/dto/launch_dto.dart';
import 'package:applifting_assignment/app/launch/data/repository/launch_repository_interface.dart';
import 'package:applifting_assignment/http/http_client_interface.dart';
import 'package:http/http.dart';

class LaunchRepository implements ILaunchRepository {
  final IHttpClient client;

  const LaunchRepository(this.client);

  @override
  Future<List<LaunchDTO>> fetchUpcomingLaunches() async {
    final response = await client.get('v5/launches/upcoming');
    return _parseLaunches(response);
  }

  @override
  Future<List<LaunchDTO>> fetchPastLaunches() async {
    final response = await client.get('v5/launches/past');
    return _parseLaunches(response);
  }

  List<LaunchDTO> _parseLaunches(Response response) {
    final decodedResponse = json.decode(response.body) as List<dynamic>;
    return decodedResponse.map((launch) => LaunchDTO.fromJson(launch)).toList();
  }
}
