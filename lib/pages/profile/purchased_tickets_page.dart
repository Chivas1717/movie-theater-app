import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/purchased_tickets_bloc/purchased_tickets_bloc.dart';
import 'package:movie_theater_app/blocs/purchased_tickets_bloc/purchased_tickets_state.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../components/profile/user_tickets_block.dart';

class PurchasedTicketsPage extends StatelessWidget {
  const PurchasedTicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchasedTicketsBloc, PurchasedTicketsState>(
      builder: (context, state) {
        if (state is PurchasedTicketsLoadingState) {
          return const Scaffold(
            backgroundColor: Color(0xFF141414),
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFf03400),
              ),
            ),
          );
        }
        if (state is PurchasedTicketsErrorState) {
          return Scaffold(
            backgroundColor: Color(0xFF141414),
            body: Center(
              child: Text(state.error),
            ),
          );
        }
        if (state is PurchasedTicketsLoadedState) {
          return Scaffold(
            backgroundColor: const Color(0xFF141414),
            body: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  //Back and title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(width: 15),
                      InkResponse(
                        radius: 25,
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          size: 26,
                          color: Colors.white,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          LocaleKeys.Your_bookings.tr(),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: UserTicketsBlock(
                        tickets: state.purchasedTickets,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
