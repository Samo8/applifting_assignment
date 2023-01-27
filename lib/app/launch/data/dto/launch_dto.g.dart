// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchDTO _$LaunchDTOFromJson(Map<String, dynamic> json) => LaunchDTO(
      rocket: json['rocket'] as String?,
      success: json['success'] as bool?,
      failures: (json['failures'] as List<dynamic>)
          .map((e) => FailureDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: json['details'] as String?,
      crew: (json['crew'] as List<dynamic>)
          .map((e) => CrewDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      ships: (json['ships'] as List<dynamic>).map((e) => e as String).toList(),
      capsules:
          (json['capsules'] as List<dynamic>).map((e) => e as String).toList(),
      payloads:
          (json['payloads'] as List<dynamic>).map((e) => e as String).toList(),
      launchpad: json['launchpad'] as String?,
      flightNumber: json['flight_number'] as int?,
      name: json['name'] as String,
      date: LaunchDTO._dateFromJson(json['date_unix'] as int),
      id: json['id'] as String,
      links: LinksDTO.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LaunchDTOToJson(LaunchDTO instance) => <String, dynamic>{
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': instance.failures,
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'flight_number': instance.flightNumber,
      'name': instance.name,
      'date_unix': LaunchDTO._dateToJson(instance.date),
      'id': instance.id,
      'links': instance.links,
    };
