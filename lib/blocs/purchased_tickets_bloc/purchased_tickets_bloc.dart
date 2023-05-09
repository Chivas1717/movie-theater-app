import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/purchased_tickets_bloc/purchased_tickets_state.dart';
import '../../repo/repositories.dart';
import 'purchased_tickets_event.dart';

class PurchasedTicketsBloc
    extends Bloc<PurchasedTicketsEvent, PurchasedTicketsState> {
  final PurchasedTicketsRepository _purchasedTicketsRepository;

  PurchasedTicketsBloc(this._purchasedTicketsRepository)
      : super(PurchasedTicketsLoadingState()) {
    on<GetPurchasedTicketsEvent>(_getPurchasedTicketsEvent);
  }

  void _getPurchasedTicketsEvent(event, emit) async {
    emit(PurchasedTicketsLoadingState());
    try {
      final result = await _purchasedTicketsRepository.getPurchasedTickets();
      emit(PurchasedTicketsLoadedState(result));
    } catch (e) {
      emit(PurchasedTicketsErrorState(e.toString()));
    }
  }
}
