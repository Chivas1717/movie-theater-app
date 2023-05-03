import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoadedState extends AuthState {
  final String accessToken;
  AuthLoadedState(this.accessToken);
  @override
  List<Object?> get props => [accessToken];
}

class AuthErrorState extends AuthState {
  final String error;
  AuthErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class OtpLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class OtpLoadedState extends AuthState {
  OtpLoadedState();
  @override
  List<Object?> get props => [];
}

class OtpErrorState extends AuthState {
  final String error;
  OtpErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
