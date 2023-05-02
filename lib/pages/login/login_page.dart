import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:movie_theater_app/blocs/auth_bloc/auth_state.dart';
import 'package:movie_theater_app/repositories/repositories.dart';

import '../../blocs/auth_bloc/auth_event.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff1a2232),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 20,
                            ),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Container(
                                    height: 240,
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    margin: const EdgeInsets.only(top: 100),
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFE1E0F5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                ),
                                // Center(
                                //   child: Container(
                                //       constraints:
                                //           const BoxConstraints(maxHeight: 340),
                                //       margin:
                                //           const EdgeInsets.symmetric(horizontal: 8),
                                //       child: Image.asset('assets/img/login.png')),
                                // ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Text(
                              'CineApp',
                              style: TextStyle(
                                color: Color(0xfffc6c19),
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: <Widget>[
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'We will send you an ',
                                      style:
                                          TextStyle(color: Color(0xfffc6c19))),
                                  TextSpan(
                                    text: 'One Time Password ',
                                    style: TextStyle(
                                      color: Color(0xfffc6c19),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'on this mobile number',
                                    style: TextStyle(
                                      color: Color(0xfffc6c19),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            constraints: const BoxConstraints(maxWidth: 500),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: CupertinoTextField(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              controller: phoneController,
                              clearButtonMode: OverlayVisibilityMode.editing,
                              keyboardType: TextInputType.phone,
                              maxLines: 1,
                              placeholder: '+38...',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: ElevatedButton(
                              onPressed: () {
                                if (phoneController.text.isNotEmpty) {
                                  BlocProvider.of<AuthBloc>(context).add(
                                    RequestOtpAuthEvent(phoneController.text),
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return OtpPage(
                                          phoneNumber: phoneController.text,
                                        );
                                      },
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        'Please enter a phone number',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfffc6c19),
                              ),
                              // shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text(
                                      'Next',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Color(0xfffc6c19),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
