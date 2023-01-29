import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'patch_dto.g.dart';

@JsonSerializable()
class PatchDTO extends Equatable {
  final String? small;
  final String? large;

  const PatchDTO({
    this.small,
    this.large,
  });

  factory PatchDTO.fromJson(Map<String, dynamic> json) => _$PatchDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PatchDTOToJson(this);

  @override
  List<Object?> get props => [small, large];
}
