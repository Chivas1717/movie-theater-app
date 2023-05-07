import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/session_model.dart';

@immutable
abstract class TicketsState {
  final List<SelectedSeat> selectedSeats;

  const TicketsState(this.selectedSeats);
}

class SelectedSeatsResultState extends TicketsState {
  const SelectedSeatsResultState(super.selectedSeats);
}

class SelectedSeatsInitial extends TicketsState {
  SelectedSeatsInitial() : super([]);
}
