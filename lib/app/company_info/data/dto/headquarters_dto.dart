import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headquarters_dto.g.dart';

@JsonSerializable()
class HeadquartersDTO extends Equatable {
  final String address;
  final String city;
  final String state;

  const HeadquartersDTO({
    required this.address,
    required this.city,
    required this.state,
  });

  factory HeadquartersDTO.fromJson(Map<String, dynamic> json) => _$HeadquartersDTOFromJson(json);
  Map<String, dynamic> toJson() => _$HeadquartersDTOToJson(this);

  @override
  List<Object> get props => [address, city, state];
}
