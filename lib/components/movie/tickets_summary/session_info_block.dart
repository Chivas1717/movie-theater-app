import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../../models/movie_model.dart';
import '../../../models/session_model.dart';

class SessionInfoBlock extends StatelessWidget {
  final SessionModel session;
  final MovieModel movie;
  const SessionInfoBlock(
      {super.key, required this.session, required this.movie});

  String convertDate(int date) {
    DateTime sessionDateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    String formattedTime =
        '${sessionDateTime.hour.toString().padLeft(2, '0')}:${sessionDateTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Date
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Date.tr(),
                style: const TextStyle(
                  fontSize: 13,
                  color: Color(0xFF949494),
                ),
              ),
              Text(
                DateFormat('E, d MMMM y').format(
                  DateTime.fromMillisecondsSinceEpoch(session.date! * 1000),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          //Time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Time.tr(),
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF949494),
                ),
              ),
              Text(
                convertDate(session.date!),
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          //Theater
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocaleKeys.Room.tr(),
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF949494),
                ),
              ),
              Text(
                session.room!.name!,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
