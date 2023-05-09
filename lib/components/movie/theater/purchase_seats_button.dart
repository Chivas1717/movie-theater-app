import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_event.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';
import 'package:movie_theater_app/pages/movie/tickets_summary_page.dart';

import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';

class PurchaseSeatsButton extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  const PurchaseSeatsButton(
      {super.key, required this.session, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, ticketsState) {
        bool disabled = ticketsState.selectedSeats.isEmpty;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: disabled
                ? () {}
                : () {
                    BlocProvider.of<PaymentBloc>(context).add(
                      BookTicketsEvent(ticketsState.selectedSeats, session.id!),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TicketSummaryPage(
                            session: session,
                            movie: movie,
                          );
                        },
                      ),
                    );
                  },
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: disabled
                    ? const LinearGradient(
                        colors: [Color(0xFF949494), Color(0xFF2b2b2b)],
                      )
                    : const LinearGradient(
                        colors: [Color(0xFFf03400), Color(0xFFf04f00)],
                      ),
              ),
              child: Center(
                child: Text(
                  'PURCHASE - ${ticketsState.selectedSeats.length} SEATS',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// CustomTextButton.gradient(
//         width: double.infinity,
//         onPressed: () {
//           AppRouter.pushNamed(Routes.TicketSummaryScreenRoute);
//         },
//         disabled: theaterSeats == 0,
//         gradient: Constants.buttonGradientOrange,
//         child: 
//       ),