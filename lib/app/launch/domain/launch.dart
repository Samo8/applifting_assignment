import 'package:equatable/equatable.dart';

import 'package:applifting_assignment/app/launch/domain/crew.dart';
import 'package:applifting_assignment/app/launch/domain/failure.dart';

class Launch extends Equatable {
  final String? rocket;
  final bool? success;
  final List<Failure> failures;
  final String? details;
  final List<Crew> crew;
  final List<String> ships;
  final List<String> capsules;
  final List<String> payloads;
  final String? launchpad;
  final int? flightNumber;
  final String name;
  final DateTime date;
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
    required this.date,
    required this.id,
  });

  Launch copyWith({
    String? rocket,
    bool? success,
    List<Failure>? failures,
    String? details,
    List<Crew>? crew,
    List<String>? ships,
    List<String>? capsules,
    List<String>? payloads,
    String? launchpad,
    int? flightNumber,
    String? name,
    DateTime? date,
    String? id,
  }) {
    return Launch(
      rocket: rocket ?? this.rocket,
      success: success ?? this.success,
      failures: failures ?? this.failures,
      details: details ?? this.details,
      crew: crew ?? this.crew,
      ships: ships ?? this.ships,
      capsules: capsules ?? this.capsules,
      payloads: payloads ?? this.payloads,
      launchpad: launchpad ?? this.launchpad,
      flightNumber: flightNumber ?? this.flightNumber,
      name: name ?? this.name,
      date: date ?? this.date,
      id: id ?? this.id,
    );
  }

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
      ];
}
