import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';
import '../../../models/session_model.dart';

class SelectedSeatsBlock extends StatelessWidget {
  final List<SelectedSeat> contents;
  final double chipHeight, chipGap;
  final double? chipWidth;
  final double fontSize;
  final bool isScrollable;
  final FontWeight? fontWeight;
  final double borderWidth;
  final Color borderColor, backgroundColor, contentColor;

  const SelectedSeatsBlock({
    Key? key,
    this.fontWeight,
    this.chipWidth,
    this.chipGap = 0.0,
    this.fontSize = 12,
    this.borderWidth = 1.0,
    this.isScrollable = false,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.contentColor = Colors.grey,
    required this.contents,
    required this.chipHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log('${contents.length}');
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        return SizedBox(
          height: chipHeight,
          child: isScrollable
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.selectedSeats.length,
                  separatorBuilder: (ctx, i) => SizedBox(width: chipGap),
                  itemBuilder: (ctx, i) => buildChipListItem(i),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < state.selectedSeats.length; i++)
                      Padding(
                        padding: EdgeInsets.only(left: i == 0 ? 0 : chipGap),
                        child: buildChipListItem(i),
                      )
                  ],
                ),
        );
      },
    );
  }

  BlocBuilder buildChipListItem(int i) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        return Container(
          width: chipWidth,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: borderColor, width: borderWidth),
          ),
          child: Center(
            child: Text(
              '${state.selectedSeats[i].row}-${state.selectedSeats[i].seat.index}',
              style: TextStyle(
                color: contentColor,
                fontSize: fontSize,
                height: 1,
                fontWeight: fontWeight,
              ),
            ),
          ),
        );
      },
    );
  }
}
