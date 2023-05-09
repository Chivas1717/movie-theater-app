import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/purchased_ticket_model.dart';

@immutable
abstract class PurchasedTicketsState extends Equatable {}

class PurchasedTicketsLoadingState extends PurchasedTicketsState {
  @override
  List<Object?> get props => [];
}

class PurchasedTicketsLoadedState extends PurchasedTicketsState {
  final List<PurchasedTicketModel> purchasedTickets;

  PurchasedTicketsLoadedState(this.purchasedTickets);
  @override
  List<Object?> get props => [];
}

class PurchasedTicketsErrorState extends PurchasedTicketsState {
  final String error;
  PurchasedTicketsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
