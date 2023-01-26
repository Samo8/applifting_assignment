import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'failure.g.dart';

@JsonSerializable()
class Failure extends Equatable {
  final num time;
  final num? altitude;
  final String reason;

  const Failure({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory Failure.fromJson(Map<String, dynamic> json) => _$FailureFromJson(json);
  Map<String, dynamic> toJson() => _$FailureToJson(this);

  @override
  List<Object?> get props => [time, altitude, reason];
}
