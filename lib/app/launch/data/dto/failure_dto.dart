import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'failure_dto.g.dart';

@JsonSerializable()
class FailureDTO extends Equatable {
  final num time;
  final num? altitude;
  final String reason;

  const FailureDTO({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  factory FailureDTO.fromJson(Map<String, dynamic> json) => _$FailureDTOFromJson(json);
  Map<String, dynamic> toJson() => _$FailureDTOToJson(this);

  @override
  List<Object?> get props => [time, altitude, reason];
}
