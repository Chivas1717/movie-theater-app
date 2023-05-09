import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_state.dart';

import '../../components/profile/browse_moovies_button.dart';
import '../../components/profile/user_profile_info.dart';
import '../../components/profile/view_tickets_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoadingState) {
          return const Scaffold(
            backgroundColor: Color(0xFF141414),
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFFf03400),
              ),
            ),
          );
        }
        if (state is ProfileErrorState) {
          return Scaffold(
            backgroundColor: Color(0xFF141414),
            body: Center(
              child: Text(state.error),
            ),
          );
        }
        if (state is ProfileLoadedState) {
          return Scaffold(
            backgroundColor: Color(0xFF141414),
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 75),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkResponse(
                        radius: 26,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFFf03400),
                          size: 30,
                        ),
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      InkResponse(
                        radius: 26,
                        child: const Icon(
                          Icons.manage_accounts_sharp,
                          color: Color(0xFFf03400),
                          size: 30,
                        ),
                        onTap: () {
                          // AppRouter.pushNamed(Routes.ChangePasswordScreenRoute);
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome',
                    style: TextStyle(
                      color: Color(0xFFf03400),
                      fontSize: 45,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 50),
                  const Flexible(
                    child: SizedBox(
                      width: double.infinity,
                      child: UserProfileInfo(),
                    ),
                  ),
                  const SizedBox(height: 140),
                  const ViewTicketsButton(),
                  const SizedBox(height: 20),
                  const BrowseMoviesButton(),
                  const SizedBox(height: 40),
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
