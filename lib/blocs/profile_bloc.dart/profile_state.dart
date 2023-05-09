import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/profile_model.dart';

@immutable
abstract class ProfileState extends Equatable {}

class ProfileLoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoadedState extends ProfileState {
  final ProfileModel profileInfo;

  ProfileLoadedState(this.profileInfo);
  @override
  List<Object?> get props => [];
}

class ProfileErrorState extends ProfileState {
  final String error;
  ProfileErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
