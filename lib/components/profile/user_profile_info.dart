import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_state.dart';

class UserProfileInfo extends StatelessWidget {
  const UserProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state is ProfileLoadedState
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Full Name Label
                  Text(
                    'Full Name',
                    style: TextStyle(
                        color: Color(0xFFf03400),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),

                  //Full Name
                  Text(
                    state.profileInfo.name ?? 'User${state.profileInfo.id}',
                    style: TextStyle(
                      color: Color(0xFFf2f2f2),
                      fontSize: 18,
                    ),
                  ),

                  const Spacer(),

                  //Contact Label
                  Text(
                    'Contact',
                    style: TextStyle(
                        color: Color(0xFFf03400),
                        fontSize: 26,
                        fontWeight: FontWeight.bold),
                  ),

                  //Contact Data
                  Text(
                    state.profileInfo.phoneNumber!,
                    style: TextStyle(
                      color: Color(0xFFf2f2f2),
                      fontSize: 18,
                    ),
                  ),

                  const Spacer()
                ],
              )
            : Container();
      },
    );
  }
}
