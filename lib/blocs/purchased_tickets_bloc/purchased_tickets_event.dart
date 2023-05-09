import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PurchasedTicketsEvent extends Equatable {
  const PurchasedTicketsEvent();
}

class GetPurchasedTicketsEvent extends PurchasedTicketsEvent {
  const GetPurchasedTicketsEvent();
  @override
  List<Object?> get props => [];
}
