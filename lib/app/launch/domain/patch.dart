import 'package:equatable/equatable.dart';

class Patch extends Equatable {
  final String? small;

  const Patch({
    this.small,
  });

  Patch copyWith({
    String? small,
  }) {
    return Patch(
      small: small ?? this.small,
    );
  }

  @override
  List<Object?> get props => [small];
}
