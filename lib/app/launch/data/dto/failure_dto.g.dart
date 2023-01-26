// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureDTO _$FailureDTOFromJson(Map<String, dynamic> json) => FailureDTO(
      time: json['time'] as num,
      altitude: json['altitude'] as num?,
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$FailureDTOToJson(FailureDTO instance) =>
    <String, dynamic>{
      'time': instance.time,
      'altitude': instance.altitude,
      'reason': instance.reason,
    };
