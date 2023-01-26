import 'package:applifting_assignment/app/launch/domain/crew.dart';
import 'package:applifting_assignment/app/launch/domain/failure.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch.g.dart';

@JsonSerializable()
class Launch {
  final String? rocket;
  final bool? success;
  final List<Failure> failures;
  final String? details;
  final List<Crew> crew;
  final List<String> ships;
  final List<String> capsules;
  final List<String> payloads;
  final String? launchpad;
  @JsonKey(name: 'flight_number')
  final int? flightNumber;
  final String name;
  @JsonKey(name: 'date_utc')
  final String dateUTC;
  final String id;

  const Launch({
    this.rocket,
    this.success,
    required this.failures,
    this.details,
    required this.crew,
    required this.ships,
    required this.capsules,
    required this.payloads,
    this.launchpad,
    this.flightNumber,
    required this.name,
    required this.dateUTC,
    required this.id,
  });

  factory Launch.fromJson(Map<String, dynamic> json) => _$LaunchFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchToJson(this);
}
