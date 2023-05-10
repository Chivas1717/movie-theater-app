import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';
import '../../../models/session_model.dart';

class Details extends StatelessWidget {
  Details({Key? key}) : super(key: key);

  final categories = ['Normal', 'Comfort', 'VIP'];

  Map<String, List> getCategorisedSeats(List<SelectedSeat> selectedSeats) {
    var categorisedSeats = {
      'Normal': [],
      'Comfort': [],
      'VIP': [],
    };

    selectedSeats.forEach((element) {
      if (element.seat.type == 0) {
        categorisedSeats['Normal']!.add(element);
      } else if (element.seat.type == 1) {
        categorisedSeats['Comfort']!.add(element);
      } else {
        categorisedSeats['VIP']!.add(element);
      }
    });

    // if (categorisedSeats['Normal']!.isEmpty) {
    //   categorisedSeats.remove('Normal');
    // }
    // if (categorisedSeats['Comfort']!.isEmpty) {
    //   categorisedSeats.remove('Comfort');
    // }
    // if (categorisedSeats['VIP']!.isEmpty) {
    //   categorisedSeats.remove('VIP');
    // }

    return categorisedSeats;
  }

  double getTotalPrice(List<SelectedSeat> selectedSeats) {
    double result = 0;
    selectedSeats.forEach((element) {
      result += element.seat.price!;
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, state) {
        var categorisedSeats = getCategorisedSeats(state.selectedSeats);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Billing Details Label
              Text(
                LocaleKeys.Billing_details.tr(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 15),

              //Billing Summary Labels
              Row(
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(
                      LocaleKeys.Qty.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    LocaleKeys.TIcket_type.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Spacer(),
                  Text(
                    LocaleKeys.Price.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15),

              //Billing Summary Data
              // for (var i = 0; i < categorisedSeats.length; i++)

              //Normal
              categorisedSeats['Normal']!.isNotEmpty
                  ? Row(
                      children: [
                        //Num of tickets
                        SizedBox(
                            width: 80,
                            child: Text(
                              '${categorisedSeats['Normal']!.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF949494),
                              ),
                            )),

                        const SizedBox(width: 10),

                        //Seat type
                        const Text(
                          'Normal',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        ),
                        const Spacer(),

                        //Price
                        Text(
                          '${categorisedSeats['Normal']![0].seat.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        )
                      ],
                    )
                  : Container(),
              //Comfort
              categorisedSeats['Comfort']!.isNotEmpty
                  ? Row(
                      children: [
                        //Num of tickets
                        SizedBox(
                            width: 80,
                            child: Text(
                              '${categorisedSeats['Comfort']!.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF949494),
                              ),
                            )),

                        const SizedBox(width: 10),

                        //Seat type
                        const Text(
                          'Comfort',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        ),
                        const Spacer(),

                        //Price
                        Text(
                          '${categorisedSeats['Comfort']![0].seat.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        )
                      ],
                    )
                  : Container(),
              //VIP
              categorisedSeats['VIP']!.isNotEmpty
                  ? Row(
                      children: [
                        //Num of tickets
                        SizedBox(
                            width: 80,
                            child: Text(
                              '${categorisedSeats['VIP']!.length}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF949494),
                              ),
                            )),

                        const SizedBox(width: 10),

                        //Seat type
                        const Text(
                          'VIP',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        ),
                        const Spacer(),

                        //Price
                        Text(
                          '${categorisedSeats['VIP']![0].seat.price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF949494),
                          ),
                        )
                      ],
                    )
                  : Container(),
              const Divider(color: Colors.black, thickness: 0.8),

              //Billing Total
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    LocaleKeys.Total.tr(
                        args: ['${getTotalPrice(state.selectedSeats)}']),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
