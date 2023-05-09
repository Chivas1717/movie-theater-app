import 'package:flutter/material.dart';
import 'package:movie_theater_app/pages/home_page.dart';

class MoreBookingsButton extends StatelessWidget {
  const MoreBookingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyHomePage();
              },
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: const Center(
            child: Text(
              'Make more bookings',
              style: TextStyle(
                color: Color(0xFFf03400),
                fontSize: 20,
                letterSpacing: 0.7,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
