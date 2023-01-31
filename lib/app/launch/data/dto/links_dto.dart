import 'package:applifting_assignment/app/launch/data/dto/flickr_dto.dart';
import 'package:applifting_assignment/app/launch/data/dto/patch_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links_dto.g.dart';

@JsonSerializable()
class LinksDTO extends Equatable {
  final PatchDTO patch;
  final FlickrDTO flickr;

  const LinksDTO({
    required this.patch,
    required this.flickr,
  });

  factory LinksDTO.fromJson(Map<String, dynamic> json) => _$LinksDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LinksDTOToJson(this);

  @override
  List<Object> get props => [patch, flickr];
}
