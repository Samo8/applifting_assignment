import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final num time;
  final num? altitude;
  final String reason;

  const Failure({
    required this.time,
    required this.altitude,
    required this.reason,
  });

  Failure copyWith({
    num? time,
    num? altitude,
    String? reason,
  }) {
    return Failure(
      time: time ?? this.time,
      altitude: altitude ?? this.altitude,
      reason: reason ?? this.reason,
    );
  }

  @override
  List<Object?> get props => [time, altitude, reason];
}
