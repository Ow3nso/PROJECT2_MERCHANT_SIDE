// lib/core/error/failures.dart
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  final int? code;

  const Failure({required this.message, this.code});

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() => 'Failure(message: $message, code: $code)';
}

// Optional: Specific failure types
class ServerFailure extends Failure {
  ServerFailure() : super(message: 'Server Error');
}