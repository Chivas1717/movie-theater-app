import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_bloc.dart';
import 'package:movie_theater_app/blocs/profile_bloc.dart/profile_event.dart';
import 'package:movie_theater_app/generated/locale_keys.g.dart';
import 'package:movie_theater_app/pages/profile/profile_page.dart';

import '../../components/profile/change_name_inputs.dart';
import '../../components/profile/save_password_button.dart';

class ChangeNamePage extends StatelessWidget {
  ChangeNamePage({super.key});
  final newNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF141414),
      body: GestureDetector(
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
                          Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2b2b2b),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                bottomRight: Radius.circular(25),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //back arrow
                                InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.only(
                                      left: 25.0 - 5,
                                      top: 80,
                                    ),
                                    child: Icon(
                                      Icons.arrow_back_sharp,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    25.0,
                                    28,
                                    25.0,
                                    27,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        LocaleKeys.Change_your_name.tr(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 22),
                                      ),
                                      const SizedBox(height: 20),
                                      ChangeNameInputs(
                                        newNameController: newNameController,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          //Save Password Button
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 40, 20, 65),
                            child: SavePasswordButton(
                              onTap: () {
                                if (newNameController.text.isNotEmpty) {
                                  BlocProvider.of<ProfileBloc>(context)
                                      .add(UpdateProfileEvent(
                                    newNameController.text,
                                  ));
                                  Navigator.of(context).pop();
                                }
                              },
                            ),
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
    );
  }
}
