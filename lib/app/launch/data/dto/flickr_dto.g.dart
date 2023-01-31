// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flickr_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlickrDTO _$FlickrDTOFromJson(Map<String, dynamic> json) => FlickrDTO(
      small: (json['small'] as List<dynamic>).map((e) => e as String).toList(),
      original:
          (json['original'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FlickrDTOToJson(FlickrDTO instance) => <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };
