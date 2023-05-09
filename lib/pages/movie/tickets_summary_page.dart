import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_state.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/confirm_tickets_button.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/tickets_summary_block.dart';

import '../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../blocs/tickets_bloc/tickets_event.dart';
import '../../models/movie_model.dart';
import '../../models/session_model.dart';

class TicketSummaryPage extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  const TicketSummaryPage({
    super.key,
    required this.session,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state is BookingLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is BookingErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
        }
        if (state is BookingLoadedState) {
          // context.read<TicketsBloc>().add(ClearSelectedSeatsEvent());
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  //Back icon and title
                  const BackIconRow(
                    text: 'Your tickets',
                    marginLeft: 95,
                  ),

                  const SizedBox(height: 20),

                  // //Tickets Box
                  TicketsSummaryBlock(
                    session: session,
                    movie: movie,
                  ),

                  //Confirm Button
                  ConfirmTicketsButton(
                    movie: movie,
                    session: session,
                  ),

                  const SizedBox(height: 5),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class BackIconRow extends StatelessWidget {
  final String text;
  final double marginLeft;
  const BackIconRow({Key? key, required this.text, required this.marginLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 15),
        InkResponse(
          radius: 25,
          child: const Icon(
            Icons.arrow_back_sharp,
            size: 26,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),

        SizedBox(width: marginLeft),

        //Title
        Text(
          text,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),

        const Spacer(),
      ],
    );
  }
}
