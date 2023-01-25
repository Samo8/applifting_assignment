import 'package:equatable/equatable.dart';

class Links extends Equatable {
  final String website;
  final String twitter;

  const Links({
    required this.website,
    required this.twitter,
  });

  Links copyWith({
    String? website,
    String? twitter,
  }) {
    return Links(
      website: website ?? this.website,
      twitter: twitter ?? this.twitter,
    );
  }

  @override
  List<Object> get props => [website, twitter];
}
