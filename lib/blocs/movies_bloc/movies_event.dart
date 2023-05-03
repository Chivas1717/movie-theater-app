import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class LoadMoviesEvent extends MoviesEvent {
  final String dateValue;
  final String searchValue;

  const LoadMoviesEvent({required this.dateValue, required this.searchValue});
  @override
  List<Object?> get props => [];
}
