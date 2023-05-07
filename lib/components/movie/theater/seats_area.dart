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
    if (widget.selectedSeats.any((item) => item.seat == seat))
      return Colors.red;
    if (seat.isAvailable!)
      return Colors.white;
    else
      return Color(0xFF5A5A5A);
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
                  child:
                      // ListView.builder(
                      //   scrollDirection: Axis.horizontal,
                      //   itemCount: 1,
                      //   itemBuilder: (_, index) {
                      //     return
                      Column(
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
                  //   },
                  // ),
                ),

                // GridView.builder(
                //   itemCount: numOfRows * seatsPerRow,
                //   scrollDirection: Axis.horizontal,
                //   padding: const EdgeInsets.only(right: 20),
                //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //     maxCrossAxisExtent: seatSize,
                //     crossAxisSpacing: seatGap,
                //     mainAxisSpacing: seatGap,
                //   ),
                //   itemBuilder: (context, i) {
                //     var currentRow = i ~/ seatsPerRow + 1;
                //     final seat = SeatModel(
                //       seatRow: String.fromCharCode(i % numOfRows + 65),
                //       seatNumber: i ~/ numOfRows,
                //     );
                //     if (isMissing(seat)) {
                //       return const SizedBox.shrink();
                //     } else if (isBlocked(seat) || isBooked(seat)) {
                //       return const DecoratedBox(
                //         decoration: BoxDecoration(
                //           color: Color(0xFF5A5A5A),
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(8),
                //           ),
                //         ),
                //       );
                //     }
                //     return SeatWidget(seat: seat);
                //   },
                // ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
