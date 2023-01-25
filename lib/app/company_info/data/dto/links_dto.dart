import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links_dto.g.dart';

@JsonSerializable()
class LinksDTO extends Equatable {
  final String website;
  final String twitter;
  final String flickr;
  @JsonKey(name: 'elon_twitter')
  final String elonTwitter;

  const LinksDTO({
    required this.website,
    required this.twitter,
    required this.flickr,
    required this.elonTwitter,
  });

  factory LinksDTO.fromJson(Map<String, dynamic> json) => _$LinksDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LinksDTOToJson(this);

  @override
  List<Object> get props => [website, twitter, flickr, elonTwitter];
}
