import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileInfoEvent extends ProfileEvent {
  const GetProfileInfoEvent();
  @override
  List<Object?> get props => [];
}

class UpdateProfileEvent extends ProfileEvent {
  final String newName;

  const UpdateProfileEvent(this.newName);

  @override
  List<Object?> get props => [];
}
