import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_event.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';

import '../../pages/profile/profile_page.dart';

class ProfileBtn extends StatelessWidget {
  const ProfileBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<ProfileBloc>(context).add(
          const GetProfileInfoEvent(),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const ProfilePage();
            },
          ),
        );
      },
      child: Container(
        height: double.infinity,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: const LinearGradient(
            begin: Alignment(0, -1),
            end: Alignment(0, 1),
            colors: <Color>[Color(0xffff8036), Color(0xfffc6c19)],
            stops: <double>[0, 1],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3fff8036),
              offset: Offset(0, 4),
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            context.locale == Locale('en') ? 'Profile' : "Профіль",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
