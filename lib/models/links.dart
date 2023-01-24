import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final String website;
  final String twitter;

  const Links({
    required this.website,
    required this.twitter,
  });

  Links copyWith({
    String? website,
    String? twitter,
  }) {
    return Links(
      website: website ?? this.website,
      twitter: twitter ?? this.twitter,
    );
  }

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
  Map<String, dynamic> toJson() => _$LinksToJson(this);

  @override
  List<Object> get props => [website, twitter];
}
