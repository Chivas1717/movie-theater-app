import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ProceedAuthEvent extends AuthEvent {
  final String phoneNumber;
  final String otp;

  const ProceedAuthEvent(this.phoneNumber, this.otp);
  @override
  List<Object?> get props => [];
}

class RequestOtpAuthEvent extends AuthEvent {
  final String phoneNumber;

  const RequestOtpAuthEvent(this.phoneNumber);

  @override
  List<Object?> get props => [];
}
