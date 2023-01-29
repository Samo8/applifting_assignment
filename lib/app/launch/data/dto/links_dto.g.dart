// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksDTO _$LinksDTOFromJson(Map<String, dynamic> json) => LinksDTO(
      patch: PatchDTO.fromJson(json['patch'] as Map<String, dynamic>),
      flickr: FlickrDTO.fromJson(json['flickr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksDTOToJson(LinksDTO instance) => <String, dynamic>{
      'patch': instance.patch,
      'flickr': instance.flickr,
    };
