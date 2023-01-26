import 'package:equatable/equatable.dart';

class Crew extends Equatable {
  final String? crew;
  final String? role;

  const Crew({
    this.crew,
    this.role,
  });

  @override
  List<Object?> get props => [crew, role];

  Crew copyWith({
    String? crew,
    String? role,
  }) {
    return Crew(
      crew: crew ?? this.crew,
      role: role ?? this.role,
    );
  }
}
