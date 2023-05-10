import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/payment_bloc/payment_event.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';
import 'package:movie_theater_app/pages/movie/result_page.dart';
import 'package:movie_theater_app/utils/form_validator.dart';

import '../../../blocs/payment_bloc/payment_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_bloc.dart';
import '../../../blocs/tickets_bloc/tickets_event.dart';
import '../../../blocs/tickets_bloc/tickets_state.dart';
import '../../../pages/movie/checkout_page.dart';

class PayButton extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  final Map<String, String> credentials;
  const PayButton(
      {super.key,
      required this.session,
      required this.movie,
      required this.credentials});

  @override
  Widget build(BuildContext context) {
    final email = credentials['email'];
    final creditCardNumber = credentials['creditCardNumber'];
    final creditCardCVV = credentials['creditCardCVV'];
    final creditCardExpiry = credentials['creditCardExpiry'];
    return BlocBuilder<TicketsBloc, TicketsState>(
      builder: (context, ticketsState) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
          child: TextButton(
            onPressed: () {
              if (FormValidator.emailRegex.hasMatch(email!) &&
                  FormValidator.creditCardNumberRegex
                      .hasMatch(creditCardNumber!) &&
                  FormValidator.creditCardCVVRegex.hasMatch(creditCardCVV!) &&
                  FormValidator.creditCardExpiryRegex
                      .hasMatch(creditCardExpiry!)) {
                BlocProvider.of<PaymentBloc>(context).add(
                  ProceedPaymentEvent(
                    selectedSeats: ticketsState.selectedSeats,
                    sessionId: session.id!,
                    email: email,
                    creditCardCVV: creditCardCVV,
                    creditCardNumber: creditCardNumber,
                    creditCardExpiry: creditCardExpiry,
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ResultPage();
                    },
                  ),
                );
              } else {
                log('not valid info');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                  colors: [Color(0xFFf03400), Color(0xFFf04f00)],
                ),
              ),
              child: Center(
                child: Text(
                  LocaleKeys.Pay.tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

// CustomTextButton.gradient(
//         width: double.infinity,
//         onPressed: () {
//           AppRouter.pushNamed(Routes.TicketSummaryScreenRoute);
//         },
//         disabled: theaterSeats == 0,
//         gradient: Constants.buttonGradientOrange,
//         child: 
//       ),