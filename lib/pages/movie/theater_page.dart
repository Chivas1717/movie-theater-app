import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_bloc.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_event.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_state.dart';
import 'package:movie_theater_app/components/movie/theater/curved_screen.dart';
import 'package:movie_theater_app/components/movie/theater/seats_categories.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';

import '../../components/movie/theater/purchase_seats_button.dart';
import '../../components/movie/theater/seats_area.dart';
import '../../components/movie/theater/selected_seats_block.dart';

class TheaterPage extends StatefulWidget {
  final SessionModel session;
  final MovieModel movie;
  const TheaterPage({super.key, required this.session, required this.movie});

  @override
  State<TheaterPage> createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  var screenScrollController = ScrollController();
  static const _seatSize = 28.0;
  static const _seatGap = 7.0;

  // List<SelectedSeat> selectedSeats = [];

  void _clearSelectedSeats() {
    context.read<TicketsBloc>().add(ClearSelectedSeatsEvent());
  }

  double getMaxGridHeight() {
    return _seatSize * (14) + _seatGap + 3;
  }

  int getSeatsPerRow() {
    int seatsPerRow = 0;
    for (var i = 0; i < widget.session.room!.rows!.length; i++) {
      seatsPerRow =
          max(widget.session.room!.rows![i].seats!.length, seatsPerRow);
    }
    return seatsPerRow;
  }

  double getMaxScreenWidth() {
    return getSeatsPerRow() * (_seatSize + _seatGap + 3);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _BackIcon(func: _clearSelectedSeats),
                  const SizedBox(height: 5),
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 550),
                      switchOutCurve: Curves.easeInBack,
                      child: Column(
                        children: [
                          //Screen
                          CurvedScreen(
                            screenScrollController: screenScrollController,
                            screenWidth: max(
                              MediaQuery.of(context).size.width,
                              getMaxScreenWidth(),
                            ),
                          ),

                          const Spacer(),

                          SeatsArea(
                            session: widget.session,
                            maxGridHeight: getMaxGridHeight(),
                            seatSize: _seatSize,
                            seatGap: _seatGap,
                            maxRows: 12,
                            numOfRows: widget.session.room!.rows!.length,
                            seatsPerRow: getSeatsPerRow(),
                            screenScrollController: screenScrollController,
                            selectedSeats: state.selectedSeats,
                          ),

                          const Spacer(),

                          //Seat color indicators
                          const SeatsCategories(),

                          const Spacer(),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 2, 0, 22),
                            child: SelectedSeatsBlock(
                              contents: state.selectedSeats,
                              chipHeight: 27,
                              chipGap: 10,
                              fontSize: 14,
                              chipWidth: 60,
                              borderColor: Color(0xfffc6c19),
                              contentColor: Color(0xfffc6c19),
                              borderWidth: 1.5,
                              fontWeight: FontWeight.bold,
                              backgroundColor:
                                  Colors.red.shade700.withOpacity(0.3),
                              isScrollable: true,
                            ),
                          ),

                          PurchaseSeatsButton(
                            session: widget.session,
                            movie: widget.movie,
                          ),

                          const SizedBox(height: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// CurvedScreen(
//       screenScrollController: screenScrollController,
//       screenWidth: MediaQuery.of(context).size.width,
//     )

class _BackIcon extends StatelessWidget {
  final func;
  const _BackIcon({super.key, required this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkResponse(
        radius: 25,
        onTap: () {
          func();
          Navigator.pop(context);
        },
        child: const DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white30,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.arrow_back_rounded, size: 23),
          ),
        ),
      ),
    );
  }
}
