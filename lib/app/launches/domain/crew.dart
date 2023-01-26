import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew extends Equatable {
  final String? crew;
  final String? role;

  const Crew({
    this.crew,
    this.role,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);
  Map<String, dynamic> toJson() => _$CrewToJson(this);

  @override
  List<Object?> get props => [crew, role];
}
