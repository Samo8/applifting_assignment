import 'package:applifting_assignment/app/launch/domain/enums/filter_by_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'launch_filter_dto.g.dart';

@JsonSerializable()
class LaunchFilterDTO extends Equatable {
  final FilterBy filterBy;
  final bool isDescending;

  const LaunchFilterDTO({
    required this.filterBy,
    required this.isDescending,
  });

  factory LaunchFilterDTO.fromJson(Map<String, dynamic> json) => _$LaunchFilterDTOFromJson(json);
  Map<String, dynamic> toJson() => _$LaunchFilterDTOToJson(this);

  @override
  List<Object?> get props => [filterBy, isDescending];
}
