import 'dart:convert';

import 'package:applifting_assignment/app/launch/data/dto/launch_filter_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ILaunchLocalFilterDatasource {
  Future<LaunchFilterDTO?> fetchFilter();
  Future<void> persistFilter(LaunchFilterDTO filter);
}

class LaunchLocalFilterDatasource implements ILaunchLocalFilterDatasource {
  static const _launchFilterKey = 'launch_filter';

  final SharedPreferences preferences;

  LaunchLocalFilterDatasource(this.preferences);

  @override
  Future<LaunchFilterDTO?> fetchFilter() async {
    final filter = preferences.getString(_launchFilterKey);
    if (filter != null) {
      return LaunchFilterDTO.fromJson(json.decode(filter));
    }
    return null;
  }

  @override
  Future<void> persistFilter(LaunchFilterDTO filter) async {
    await preferences.setString(
      _launchFilterKey,
      json.encode(filter.toJson()),
    );
  }
}
