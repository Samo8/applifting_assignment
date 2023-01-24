import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headquarters.g.dart';

@JsonSerializable()
class Headquarters extends Equatable {
  final String address;
  final String city;
  final String state;

  const Headquarters({
    required this.address,
    required this.city,
    required this.state,
  });

  Headquarters copyWith({
    String? address,
    String? city,
    String? state,
  }) {
    return Headquarters(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
    );
  }

  factory Headquarters.fromJson(Map<String, dynamic> json) => _$HeadquartersFromJson(json);
  Map<String, dynamic> toJson() => _$HeadquartersToJson(this);

  @override
  List<Object> get props => [address, city, state];
}
