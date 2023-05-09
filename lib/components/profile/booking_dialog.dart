import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/purchased_ticket_model.dart';

class BookingDialog extends StatelessWidget {
  final String posterUrl;
  final List<PurchasedTicketModel> groupOfTickets;

  const BookingDialog({
    Key? key,
    required this.posterUrl,
    required this.groupOfTickets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 400,
        width: 250,
        child: Column(
          children: [
            //Movie Image
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(groupOfTickets[0].image!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              child: Material(
                color: Color(0xFF141414),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                  child: Column(
                    children: [
                      //Column Labels
                      Row(
                        children: const [
                          //Seat label
                          SizedBox(
                            width: 50,
                            child: Text(
                              'Seat',
                              style: TextStyle(
                                color: Color(0xFFf2f2f2),
                              ),
                            ),
                          ),

                          //Price label
                          Expanded(
                            child: Text(
                              'Room',
                              style: TextStyle(
                                color: Color(0xFFf2f2f2),
                              ),
                            ),
                          ),

                          //Status label
                          SizedBox(
                            width: 100,
                            child: Text(
                              'Seat Status',
                              style: TextStyle(
                                color: Color(0xFFf2f2f2),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      //Column data
                      Expanded(
                        child: ListView.separated(
                          itemCount: groupOfTickets.length,
                          padding: const EdgeInsets.all(0),
                          separatorBuilder: (ctx, i) =>
                              const SizedBox(height: 20),
                          itemBuilder: (ctx, i) => _BookingSeatsListItem(
                            ticket: groupOfTickets[i],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //Expand icon
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFf03400),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
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

class _BookingSeatsListItem extends StatelessWidget {
  const _BookingSeatsListItem({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final PurchasedTicketModel ticket;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Seat Name
        SizedBox(
          width: 50,
          child: Text(
            '${String.fromCharCode(ticket.rowIndex! + 64)}-${ticket.seatIndex}',
            style: const TextStyle(
              color: Color(0xFF949494),
              fontSize: 13,
            ),
          ),
        ),

        //Seat Price
        Expanded(
          child: Text(
            "${ticket.roomName}",
            style: const TextStyle(
              color: Color(0xFF949494),
              fontSize: 13,
            ),
          ),
        ),

        //Seat Status
        SizedBox(
          width: 100,
          child: Row(
            children: [
              //Booking Status value
              Text(
                'Confirmed',
                style: const TextStyle(
                  color: Color(0xFF949494),
                  fontSize: 13,
                ),
              ),

              const Spacer(),
              const Icon(
                Icons.check_circle_sharp,
                size: 16,
                color: Color(0xFF64DD17),
              ),
            ],
          ),
        )
      ],
    );
  }
}
