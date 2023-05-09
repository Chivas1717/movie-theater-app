import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/profile/booking_preview_block.dart';
import 'package:movie_theater_app/models/purchased_ticket_model.dart';

import 'booking_dialog.dart';

class UserTicketsBlock extends StatelessWidget {
  const UserTicketsBlock({
    Key? key,
    required this.tickets,
  }) : super(key: key);

  static const movieSize = 100.0;
  final List<PurchasedTicketModel> tickets;

  void onTap(BuildContext context, oneMovieTickets) {
    showGeneralDialog(
      barrierColor: const Color(0xBF000000),
      transitionDuration: const Duration(milliseconds: 400),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      transitionBuilder: (context, a1, a2, dialog) {
        final curveValue =
            (1 - Curves.linearToEaseOut.transform(a1.value)) * 200;
        return Transform(
          transform: Matrix4.translationValues(curveValue, 0.0, 0.0),
          child: Opacity(opacity: a1.value, child: dialog),
        );
      },
      pageBuilder: (_, __, ___) => BookingDialog(
        posterUrl: oneMovieTickets[0].smallImage,
        groupOfTickets: oneMovieTickets,
      ),
    );
  }

  List<List<PurchasedTicketModel>> getSortedTickets(tickets) {
    List<List<PurchasedTicketModel>> result = [];

    void putTicket(PurchasedTicketModel ticket) {
      if (result.isNotEmpty) {
        for (var i = 0; i < result.length; i++) {
          for (var item in result[i]) {
            if (ticket.movieId == item.movieId && ticket.date == item.date) {
              result[i].add(ticket);
              return;
            }
          }
        }
      }
      result.add([ticket]);
      return;
    }

    for (var element in tickets) {
      putTicket(element);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var sortedTickets = getSortedTickets(tickets);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: sortedTickets.length,
      separatorBuilder: (_, i) => const SizedBox(height: 20),
      itemBuilder: (_, i) {
        final groupOfTickets = sortedTickets[i];
        final noOfSeats = groupOfTickets.length;
        return SizedBox(
          height: 140,
          child: GestureDetector(
            onTap: () => onTap(context, groupOfTickets),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                BookingPreviewBlock(
                  room: groupOfTickets[0].roomName!,
                  noOfSeats: noOfSeats,
                  title: groupOfTickets[0].name!,
                  showDateTime: groupOfTickets[0].date!,
                ),
                Positioned(
                  bottom: 13,
                  left: 13,
                  child: Container(
                    height: 125,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        image: NetworkImage(groupOfTickets[0].smallImage!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
