import 'package:equatable/equatable.dart';

class HttpException extends Equatable implements Exception {
  final String message;

  const HttpException(this.message);

  @override
  List<Object> get props => [message];
}
