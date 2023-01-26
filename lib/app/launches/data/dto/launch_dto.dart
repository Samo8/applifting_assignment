import 'package:applifting_assignment/app/launches/data/dto/crew_dto.dart';
import 'package:applifting_assignment/app/launches/data/dto/failure_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_dto.g.dart';

@JsonSerializable()
class LaunchDTO {
  final String? rocket;
  final bool? success;
  final List<FailureDTO> failures;
  final String? details;
  final List<CrewDTO> crew;
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

  const LaunchDTO({
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

  factory LaunchDTO.fromJson(Map<String, dynamic> json) => _$LaunchDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchDTOToJson(this);
}
