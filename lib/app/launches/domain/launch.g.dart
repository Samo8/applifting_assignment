// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Launch _$LaunchFromJson(Map<String, dynamic> json) => Launch(
      rocket: json['rocket'] as String?,
      success: json['success'] as bool?,
      failures: (json['failures'] as List<dynamic>)
          .map((e) => Failure.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: json['details'] as String?,
      crew: (json['crew'] as List<dynamic>)
          .map((e) => Crew.fromJson(e as Map<String, dynamic>))
          .toList(),
      ships: (json['ships'] as List<dynamic>).map((e) => e as String).toList(),
      capsules:
          (json['capsules'] as List<dynamic>).map((e) => e as String).toList(),
      payloads:
          (json['payloads'] as List<dynamic>).map((e) => e as String).toList(),
      launchpad: json['launchpad'] as String?,
      flightNumber: json['flight_number'] as int?,
      name: json['name'] as String,
      dateUTC: json['date_utc'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$LaunchToJson(Launch instance) => <String, dynamic>{
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
      'date_utc': instance.dateUTC,
      'id': instance.id,
    };
