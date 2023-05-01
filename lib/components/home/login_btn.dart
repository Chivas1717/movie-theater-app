import 'package:flutter/material.dart';

class LoginBtn extends StatelessWidget {
  final String text;

  const LoginBtn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: const Center(
        child: Text(
          'Log in',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
