// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksDTO _$LinksDTOFromJson(Map<String, dynamic> json) => LinksDTO(
      website: json['website'] as String,
      twitter: json['twitter'] as String,
      flickr: json['flickr'] as String,
      elonTwitter: json['elon_twitter'] as String,
    );

Map<String, dynamic> _$LinksDTOToJson(LinksDTO instance) => <String, dynamic>{
      'website': instance.website,
      'twitter': instance.twitter,
      'flickr': instance.flickr,
      'elon_twitter': instance.elonTwitter,
    };
