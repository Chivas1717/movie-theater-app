import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/tickets_bloc/tickets_event.dart';

import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../models/session_model.dart';
import 'seat_widget.dart';

class SeatsArea extends StatefulWidget {
  final SessionModel session;
  final double maxGridHeight, seatSize, seatGap;
  final int numOfRows, maxRows, seatsPerRow;
  final ScrollController screenScrollController;
  final List<SelectedSeat> selectedSeats;

  const SeatsArea(
      {required this.maxGridHeight,
      required this.seatSize,
      required this.seatGap,
      required this.numOfRows,
      required this.maxRows,
      required this.seatsPerRow,
      required this.screenScrollController,
      required this.session,
      required this.selectedSeats});

  @override
  State<SeatsArea> createState() => _SeatsAreaState();
}

class _SeatsAreaState extends State<SeatsArea> {
  bool _onGlowNotification(OverscrollIndicatorNotification overScroll) {
    overScroll.disallowIndicator();
    return true;
  }

  bool _onScrollNotification(ScrollNotification scrollInfo) {
    if (scrollInfo is ScrollUpdateNotification) {
      widget.screenScrollController.jumpTo(
        scrollInfo.metrics.pixels,
      );
    }
    return true;
  }

  Color getColor(Seat seat) {
    if (!seat.isAvailable!) return Color(0xFF5A5A5A);
    if (widget.selectedSeats.any((item) => item.seat == seat))
      return Colors.red;
    if (seat.isAvailable! && seat.type == 1) return Colors.yellow[200]!;
    if (seat.isAvailable! && seat.type == 2) return Colors.yellow[600]!;

    return Colors.white;
  }

  void toggleSelection(SelectedSeat selectedSeat) {
    context.read<TicketsBloc>().add(
          UpdateSelectedSeatsEvent(selectedSeat: selectedSeat),
        );

    // // log(selectedSeat.row);
    // setState(() {
    //   if (widget.selectedSeats.any((item) => item.seat == selectedSeat.seat)) {
    //     widget.selectedSeats
    //         .removeWhere((item) => item.seat == selectedSeat.seat);
    //   } else {
    //     widget.selectedSeats.add(selectedSeat);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.maxGridHeight * widget.numOfRows / widget.maxRows,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Seat letters' column
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < widget.numOfRows; i++)
                SizedBox(
                  height: 26.5,
                  child: Center(
                    child: Text(
                      String.fromCharCode(i + 65),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
            ],
          ),

          const SizedBox(width: 10),

          //Seats
          NotificationListener<OverscrollIndicatorNotification>(
            onNotification: _onGlowNotification,
            child: Flexible(
              child: NotificationListener<ScrollNotification>(
                onNotification: _onScrollNotification,
                child: SizedBox(
                  height:
                      widget.maxGridHeight * widget.numOfRows / widget.maxRows -
                          5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i = 0;
                          i < widget.session.room!.rows!.length;
                          i++)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var j = 0;
                                j < widget.session.room!.rows![i].seats!.length;
                                j++)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: widget.session.room!.rows![i].seats![j]
                                          .isAvailable!
                                      ? () {
                                          var seat = widget
                                              .session.room!.rows![i].seats![j];

                                          toggleSelection(
                                            SelectedSeat(
                                              seat: seat,
                                              row: String.fromCharCode(i + 65),
                                            ),
                                          );
                                        }
                                      : () {},
                                  child: SeatWidget(
                                    seat:
                                        widget.session.room!.rows![i].seats![j],
                                    color: getColor(
                                      widget.session.room!.rows![i].seats![j],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
