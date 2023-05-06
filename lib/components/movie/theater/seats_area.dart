import 'dart:developer';

import 'package:flutter/material.dart';

//Widgets
import '../../../models/session_model.dart';
import 'seat_widget.dart';

class SeatsArea extends StatefulWidget {
  final SessionModel session;
  final double maxGridHeight, seatSize, seatGap;
  final int numOfRows, maxRows, seatsPerRow;
  final ScrollController screenScrollController;

  const SeatsArea(
      {required this.maxGridHeight,
      required this.seatSize,
      required this.seatGap,
      required this.numOfRows,
      required this.maxRows,
      required this.seatsPerRow,
      required this.screenScrollController,
      required this.session});

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
    if (selectedSeats.contains(seat)) return Colors.red;
    if (seat.isAvailable!)
      return Colors.green;
    else
      return Colors.grey;
  }

  void toggleSelection(Seat seat) {
    setState(() {
      if (selectedSeats.contains(seat))
        selectedSeats.remove(seat);
      else
        selectedSeats.add(seat);
    });
  }

  List<Seat> selectedSeats = [];

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
                                  onTap: () => toggleSelection(
                                    widget.session.room!.rows![i].seats![j],
                                  ),
                                  child: SeatWidget(
                                    seat:
                                        widget.session.room!.rows![i].seats![j],
                                    selectedSeats: selectedSeats,
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
