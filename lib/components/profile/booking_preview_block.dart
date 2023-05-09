import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingPreviewBlock extends StatelessWidget {
  final String title, room;
  final int noOfSeats;
  final int showDateTime;

  const BookingPreviewBlock({
    Key? key,
    required this.room,
    required this.title,
    required this.noOfSeats,
    required this.showDateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(showDateTime * 1000);
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Ticket total and movie name
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF2b2b2b),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(125, 10, 5, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Movie data
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 17,
                      color: Color(0xFFf2f2f2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  Row(
                    children: [
                      //Show date icon
                      const Icon(
                        Icons.date_range_outlined,
                        size: 19,
                        color: Color(0xFFf03400),
                      ),

                      const SizedBox(width: 10),

                      //Show time data
                      Text(
                        DateFormat('d MMMM,yy H:m').format(time),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFf2f2f2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  //Show timings row
                  Row(
                    children: [
                      //Show date icon
                      const Icon(
                        Icons.meeting_room_outlined,
                        size: 19,
                        color: Colors.green,
                      ),

                      const SizedBox(width: 10),

                      //Show time data
                      Text(
                        room,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFf2f2f2),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),
                ],
              ),
            ),
          ),

          //No of seats
          SizedBox(
            height: double.infinity,
            width: 45,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFf03400), Color(0xFFed0000)],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Ticket icon
                  const Icon(
                    Icons.local_activity_sharp,
                    color: Color(0xFFf2f2f2),
                  ),

                  const SizedBox(height: 5),

                  //No. of seats
                  Text(
                    '$noOfSeats',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFFf2f2f2),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
