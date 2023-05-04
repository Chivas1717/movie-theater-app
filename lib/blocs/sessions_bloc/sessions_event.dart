import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SessionsEvent extends Equatable {
  const SessionsEvent();
}

class LoadSessionsEvent extends SessionsEvent {
  final String dateValue;
  final String movieId;

  const LoadSessionsEvent({required this.dateValue, required this.movieId});
  @override
  List<Object?> get props => [];
}
