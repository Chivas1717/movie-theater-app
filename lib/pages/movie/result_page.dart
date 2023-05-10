import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_state.dart';
import 'package:movie_theater_app/components/movie/billing/more_bookings_button.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../blocs/tickets_bloc/tickets_event.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentBloc, PaymentState>(
      builder: (context, state) {
        if (state is PaymentLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is PaymentErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
        }
        if (state is PaymentLoadedState) {
          context.read<TicketsBloc>().add(ClearSelectedSeatsEvent());
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFed0000), Color(0xFFf04f00)],
                ),
              ),
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),

                  const Icon(
                    Icons.check_circle_outline_rounded,
                    color: Colors.white,
                    size: 64,
                  ),

                  const SizedBox(height: 10),

                  //Text
                  Expanded(
                    child: Text(
                      LocaleKeys.Your_tickets_have_been_purchased.tr(),
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  const MoreBookingsButton(),
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
