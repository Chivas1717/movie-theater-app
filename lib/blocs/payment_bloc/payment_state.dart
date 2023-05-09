import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PaymentState extends Equatable {}

class PaymentLoadingState extends PaymentState {
  @override
  List<Object?> get props => [];
}

class PaymentLoadedState extends PaymentState {
  @override
  List<Object?> get props => [];
}

class PaymentErrorState extends PaymentState {
  final String error;
  PaymentErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class BookingLoadingState extends PaymentState {
  @override
  List<Object?> get props => [];
}

class BookingLoadedState extends PaymentState {
  BookingLoadedState();
  @override
  List<Object?> get props => [];
}

class BookingErrorState extends PaymentState {
  final String error;
  BookingErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
