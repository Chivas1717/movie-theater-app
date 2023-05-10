import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/dashed_ticket_separetor.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/session_info_block.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/tickets_block.dart';

import '../../../models/movie_model.dart';
import '../../../models/session_model.dart';

class TicketsSummaryBlock extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  const TicketsSummaryBlock(
      {super.key, required this.session, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.72,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 255,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(movie.image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SessionInfoBlock(
              session: session,
              movie: movie,
            ),
            const DashedTicketSeparator(),
            const Expanded(
              child: TicketsBlock(),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFf03400),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Icon(
                Icons.expand_more_sharp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
