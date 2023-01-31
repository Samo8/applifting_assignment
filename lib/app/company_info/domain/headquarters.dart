import 'package:equatable/equatable.dart';

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

  @override
  List<Object> get props => [address, city, state];
}
