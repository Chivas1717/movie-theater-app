import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/auth_bloc/auth_bloc.dart';
import 'package:movie_theater_app/blocs/auth_bloc/auth_event.dart';
import 'package:movie_theater_app/blocs/auth_bloc/auth_state.dart';
import 'package:movie_theater_app/pages/home_page.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;

  const OtpPage({super.key, required this.phoneNumber});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String text = '';

  void _onKeyboardTap(String value) {
    setState(() {
      if (text.length < 4) text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    try {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfffc6c19), width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Center(
            child: Text(
          text[position],
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )),
      );
    } catch (e) {
      return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xfffc6c19), width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(8))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is OtpLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is OtpErrorState) {
          return const Scaffold(
            body: Center(
              child: Text('error'),
            ),
          );
        }
        if (state is OtpLoadedState) {
          return Scaffold(
            body: Center(
              child: Scaffold(
                backgroundColor: const Color(0xff1a2232),
                appBar: AppBar(
                  leading: IconButton(
                    icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xb21e283d),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xfffc6c19),
                        size: 16,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  elevation: 0,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: const Text(
                                      'Enter 4 digits verification code sent to your number',
                                      style: TextStyle(
                                        color: Color(0xfffc6c19),
                                        fontSize: 26,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 500),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        otpNumberWidget(0),
                                        otpNumberWidget(1),
                                        otpNumberWidget(2),
                                        otpNumberWidget(3),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              constraints: const BoxConstraints(maxWidth: 500),
                              child: ElevatedButton(
                                onPressed: () {
                                  if (text.isNotEmpty) {
                                    BlocProvider.of<AuthBloc>(context).add(
                                      ProceedAuthEvent(
                                        widget.phoneNumber,
                                        text,
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return MyHomePage();
                                        },
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
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
                                  backgroundColor: const Color(0xfffc6c19),
                                ),
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
                                        'Confirm',
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
                            ),
                            NumericKeyboard(
                              onKeyboardTap: _onKeyboardTap,
                              textColor: const Color(0xfffc6c19),
                              rightIcon: const Icon(
                                Icons.backspace,
                                color: Color(0xfffc6c19),
                              ),
                              rightButtonFn: () {
                                setState(() {
                                  if (text.isNotEmpty) {
                                    text = text.substring(0, text.length - 1);
                                  }
                                });
                              },
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
        }
        return Container();
      },
    );
  }
}
