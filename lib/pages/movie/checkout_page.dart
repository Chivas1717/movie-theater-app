import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/movie/billing/details.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';
import 'package:movie_theater_app/pages/movie/tickets_summary_page.dart';

import '../../components/movie/billing/credentials_input_block.dart';
import '../../components/movie/billing/pay_btn.dart';
import '../../models/movie_model.dart';
import '../../models/session_model.dart';

class CheckoutPage extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  CheckoutPage({
    super.key,
    required this.session,
    required this.movie,
  });

  final creditCardNumberController = TextEditingController(text: '');
  final creditCardCVVController = TextEditingController(text: '');
  final creditCardExpiryController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: LayoutBuilder(
            builder: (context, constraint) {
              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overScroll) {
                  overScroll.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraint.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          verticalDirection: VerticalDirection.down,
                          children: [
                            const SizedBox(height: 20),

                            //Back icon and title
                            BackIconRow(
                              text: LocaleKeys.Payment_checkout.tr(),
                              marginLeft: 65,
                            ),

                            const SizedBox(height: 20),

                            //Bill Details White Box
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                              ),
                              child: Details(),
                            ),

                            const SizedBox(height: 20),

                            // Payment Details Black Box
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: const BoxDecoration(
                                  color: Color(0xb21e283d),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: CredentialsInputBlock(
                                      creditCardCVVController:
                                          creditCardCVVController,
                                      creditCardExpiryController:
                                          creditCardExpiryController,
                                      creditCardNumberController:
                                          creditCardNumberController,
                                      emailController: emailController,
                                    )),
                                  ],
                                ),
                              ),
                            ),

                            // Pay Button
                            PayButton(
                              movie: movie,
                              session: session,
                              credentials: {
                                'creditCardNumber':
                                    creditCardNumberController.text,
                                'creditCardCVV': creditCardCVVController.text,
                                'creditCardExpiry':
                                    creditCardExpiryController.text,
                                'email': emailController.text,
                              },
                            ),

                            const SizedBox(height: 5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
