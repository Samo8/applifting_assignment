import 'package:equatable/equatable.dart';

class CustomHttpException extends Equatable implements Exception {
  final String message;
  final int? statusCode;

  const CustomHttpException({
    required this.message,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, statusCode];
}
