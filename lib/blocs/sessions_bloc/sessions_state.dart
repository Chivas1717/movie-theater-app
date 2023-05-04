import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/session_model.dart';

@immutable
abstract class SessionsState extends Equatable {}

class SessionsLoadingState extends SessionsState {
  @override
  List<Object?> get props => [];
}

class SessionsLoadedState extends SessionsState {
  final List<SessionModel> sessions;

  SessionsLoadedState(this.sessions);
  @override
  List<Object?> get props => [sessions];
}

class SessionsErrorState extends SessionsState {
  final String error;
  SessionsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class OtpLoadingState extends SessionsState {
  @override
  List<Object?> get props => [];
}

class OtpLoadedState extends SessionsState {
  OtpLoadedState();
  @override
  List<Object?> get props => [];
}

class OtpErrorState extends SessionsState {
  final String error;
  OtpErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
