// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headquarters_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadquartersDTO _$HeadquartersDTOFromJson(Map<String, dynamic> json) =>
    HeadquartersDTO(
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$HeadquartersDTOToJson(HeadquartersDTO instance) =>
    <String, dynamic>{
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
    };
