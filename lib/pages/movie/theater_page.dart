import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_theater_app/components/movie/theater/curved_screen.dart';
import 'package:movie_theater_app/models/session_model.dart';

import '../../components/movie/theater/seats_area.dart';

class TheaterPage extends StatefulWidget {
  final SessionModel session;
  const TheaterPage({super.key, required this.session});

  @override
  State<TheaterPage> createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  var screenScrollController = ScrollController();
  static const _seatSize = 28.0;
  static const _seatGap = 7.0;

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              //Icons row
              const _BackIcon(),

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
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// CurvedScreen(
//       screenScrollController: screenScrollController,
//       screenWidth: MediaQuery.of(context).size.width,
//     )

class _BackIcon extends StatelessWidget {
  const _BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkResponse(
        radius: 25,
        onTap: () {
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
