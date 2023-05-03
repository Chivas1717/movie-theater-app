import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/movie_model.dart';

@immutable
abstract class MoviesState extends Equatable {}

class MoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesLoadedState extends MoviesState {
  final List<MovieModel> movies;

  MoviesLoadedState(this.movies);
  @override
  List<Object?> get props => [movies];
}

class MoviesErrorState extends MoviesState {
  final String error;
  MoviesErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class OtpLoadingState extends MoviesState {
  @override
  List<Object?> get props => [];
}

class OtpLoadedState extends MoviesState {
  OtpLoadedState();
  @override
  List<Object?> get props => [];
}

class OtpErrorState extends MoviesState {
  final String error;
  OtpErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
