import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flickr_dto.g.dart';

@JsonSerializable()
class FlickrDTO extends Equatable {
  final List<String> small;
  final List<String> original;

  const FlickrDTO({
    required this.small,
    required this.original,
  });

  factory FlickrDTO.fromJson(Map<String, dynamic> json) => _$FlickrDTOFromJson(json);
  Map<String, dynamic> toJson() => _$FlickrDTOToJson(this);

  @override
  List<Object> get props => [small, original];
}
