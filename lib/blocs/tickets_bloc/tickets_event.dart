import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/session_model.dart';

@immutable
abstract class TicketsEvent extends Equatable {
  const TicketsEvent();
}

class UpdateSelectedSeatsEvent extends TicketsEvent {
  final SelectedSeat selectedSeat;

  const UpdateSelectedSeatsEvent({required this.selectedSeat});
  @override
  List<Object?> get props => [];
}

class ClearSelectedSeatsEvent extends TicketsEvent {
  @override
  List<Object?> get props => [];
}
