import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crew_dto.g.dart';

@JsonSerializable()
class CrewDTO extends Equatable {
  final String? crew;
  final String? role;

  const CrewDTO({
    this.crew,
    this.role,
  });

  factory CrewDTO.fromJson(Map<String, dynamic> json) => _$CrewDTOFromJson(json);
  Map<String, dynamic> toJson() => _$CrewDTOToJson(this);

  @override
  List<Object?> get props => [crew, role];
}
