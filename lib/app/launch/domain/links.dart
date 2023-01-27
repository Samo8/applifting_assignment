import 'package:equatable/equatable.dart';

import 'package:applifting_assignment/app/launch/domain/patch.dart';

class Links extends Equatable {
  final Patch patch;

  const Links({
    required this.patch,
  });

  Links copyWith({
    Patch? patch,
  }) {
    return Links(
      patch: patch ?? this.patch,
    );
  }

  @override
  List<Object> get props => [patch];
}
