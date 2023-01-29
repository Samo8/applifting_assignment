import 'package:applifting_assignment/app/launch/data/dto/crew_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/failure_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/links_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_dto.g.dart';

@JsonSerializable()
class LaunchDTO extends Equatable {
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
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson, name: 'date_unix')
  final DateTime date;
  final String id;
  final LinksDTO links;

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
    required this.date,
    required this.id,
    required this.links,
  });

  factory LaunchDTO.fromJson(Map<String, dynamic> json) => _$LaunchDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchDTOToJson(this);

  @override
  List<Object?> get props => [
        rocket,
        success,
        failures,
        details,
        crew,
        ships,
        capsules,
        payloads,
        launchpad,
        flightNumber,
        name,
        date,
        id,
        links,
      ];

  static DateTime _dateFromJson(int date) => DateTime.fromMillisecondsSinceEpoch(date * 1000);
  static int _dateToJson(DateTime date) => date.millisecondsSinceEpoch;
}
