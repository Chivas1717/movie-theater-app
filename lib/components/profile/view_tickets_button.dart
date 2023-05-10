import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/purchased_tickets_bloc/purchased_tickets_bloc.dart';
import 'package:movie_theater_app/blocs/purchased_tickets_bloc/purchased_tickets_event.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../pages/profile/purchased_tickets_page.dart';

class ViewTicketsButton extends StatelessWidget {
  const ViewTicketsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextButton(
        onPressed: () {
          BlocProvider.of<PurchasedTicketsBloc>(context).add(
            const GetPurchasedTicketsEvent(),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return PurchasedTicketsPage();
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFf03400), width: 4),
          ),
          child: Center(
            child: Text(
              LocaleKeys.View_your_tickets.tr(),
              style: TextStyle(
                color: Color(0xFFf03400),
                fontSize: 15,
                letterSpacing: 0.7,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}



// CustomTextButton.outlined(
//       width: double.infinity,
//       onPressed: () => AppRouter.pushNamed(Routes.UserBookingsScreenRoute),
//       border: Border.all(color: Constants.primaryColor, width: 4),
//       child: const Center(
//         child: Text(
//           'VIEW BOOKINGS',
//           style: TextStyle(
//             color: Constants.primaryColor,
//             fontSize: 15,
//             letterSpacing: 0.7,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//     ;
