import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/components/movie/tickets_summary/dashed_ticket_separetor.dart';
import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';

class TicketsBlock extends StatelessWidget {
  const TicketsBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        return ListView.separated(
          itemCount: state.selectedSeats.length,
          separatorBuilder: (_, i) => const DashedTicketSeparator(),
          itemBuilder: (_, i) => Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Seat icon
                const Icon(
                  Icons.event_seat_sharp,
                  color: Color(0xFFf03400),
                ),

                //Seat
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Seat',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF949494),
                      ),
                    ),
                    Text(
                      '${state.selectedSeats[i].row}-${state.selectedSeats[i].seat.index}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),

                //Price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Price',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF949494),
                      ),
                    ),
                    Text(
                      '${state.selectedSeats[i].seat.price} UAH',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
