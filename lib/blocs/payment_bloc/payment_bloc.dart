import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_event.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_state.dart';

import '../../repo/repositories.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _paymentRepository;

  PaymentBloc(this._paymentRepository) : super(PaymentLoadingState()) {
    on<BookTicketsEvent>(_bookTicketsEvent);
    on<ProceedPaymentEvent>(_proceedPaymentEvent);
  }

  void _bookTicketsEvent(event, emit) async {
    emit(BookingLoadingState());
    try {
      final result = await _paymentRepository.bookTickets(
          event.selectedSeats, event.sessionId);
      emit(BookingLoadedState());
    } catch (e) {
      // log(e.toString());
      emit(BookingErrorState(e.toString()));
    }
  }

  void _proceedPaymentEvent(event, emit) async {
    emit(PaymentLoadingState());
    try {
      final result = await _paymentRepository.buyTickets(
        event.selectedSeats,
        event.sessionId,
        event.email,
        event.creditCardNumber,
        event.creditCardExpiry,
        event.creditCardCVV,
      );
      log('${result}');
      emit(PaymentLoadedState());
    } catch (e) {
      emit(PaymentErrorState(e.toString()));
    }
  }
}
