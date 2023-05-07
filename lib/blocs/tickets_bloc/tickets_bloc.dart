import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_event.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_state.dart';

class TicketsBloc extends Bloc<TicketsEvent, TicketsState> {
  TicketsBloc() : super(SelectedSeatsInitial()) {
    on<UpdateSelectedSeatsEvent>(_updateSelectedSeatsEvent);
    on<ClearSelectedSeatsEvent>(_clearSelectedSeatsEvent);
  }

  void _updateSelectedSeatsEvent(
      UpdateSelectedSeatsEvent event, Emitter<TicketsState> emit) {
    final state = this.state;

    if (state.selectedSeats
        .any((item) => item.seat == event.selectedSeat.seat)) {
      state.selectedSeats
          .removeWhere((item) => item.seat == event.selectedSeat.seat);
      emit(SelectedSeatsResultState(state.selectedSeats));
    } else {
      state.selectedSeats.add(event.selectedSeat);
      emit(SelectedSeatsResultState(state.selectedSeats));
    }
  }

  void _clearSelectedSeatsEvent(
      ClearSelectedSeatsEvent event, Emitter<TicketsState> emit) {
    state.selectedSeats.clear();
    emit(SelectedSeatsResultState(state.selectedSeats));
  }
}
