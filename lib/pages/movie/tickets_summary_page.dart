import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/tickets_summary_block.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            //Back icon and title
            const _BackIconRow(),

            const SizedBox(height: 20),

            // //Tickets Box
            TicketsSummaryBlock(
              session: session,
              movie: movie,
            ),

            // //Confirm Button
            // ConfirmBookingsButton(),

            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

class _BackIconRow extends StatelessWidget {
  const _BackIconRow({Key? key}) : super(key: key);

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

        const SizedBox(width: 95),

        //Title
        const Text(
          'Your tickets',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),

        const Spacer(),
      ],
    );
  }
}
