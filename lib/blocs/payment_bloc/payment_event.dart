import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/session_model.dart';

@immutable
abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class ProceedPaymentEvent extends PaymentEvent {
  final List<SelectedSeat> selectedSeats;
  final int sessionId;
  final String email, creditCardNumber, creditCardCVV, creditCardExpiry;

  const ProceedPaymentEvent({
    required this.selectedSeats,
    required this.sessionId,
    required this.email,
    required this.creditCardNumber,
    required this.creditCardCVV,
    required this.creditCardExpiry,
  });
  @override
  List<Object?> get props => [];
}

class BookTicketsEvent extends PaymentEvent {
  final List<SelectedSeat> selectedSeats;
  final int sessionId;

  const BookTicketsEvent(this.selectedSeats, this.sessionId);

  @override
  List<Object?> get props => [];
}
