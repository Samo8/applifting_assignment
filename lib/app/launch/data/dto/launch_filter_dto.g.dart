// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchFilterDTO _$LaunchFilterDTOFromJson(Map<String, dynamic> json) => LaunchFilterDTO(
      filterBy: $enumDecode(_$FilterByEnumMap, json['filterBy']),
      isDescending: json['isDescending'] as bool,
    );

Map<String, dynamic> _$LaunchFilterDTOToJson(LaunchFilterDTO instance) => <String, dynamic>{
      'filterBy': _$FilterByEnumMap[instance.filterBy]!,
      'isDescending': instance.isDescending,
    };

const _$FilterByEnumMap = {
  FilterBy.id: 'id',
  FilterBy.date: 'year',
};
