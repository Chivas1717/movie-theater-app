import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';

import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';

class ConfirmTicketsButton extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  const ConfirmTicketsButton(
      {super.key, required this.session, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return TicketSummaryPage(
              //         session: session,
              //         movie: movie,
              //       );
              //     },
              //   ),
              // );
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Color(0xFFf03400), Color(0xFFf04f00)],
                ),
              ),
              child: const Center(
                child: Text(
                  'CONFIRM',
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