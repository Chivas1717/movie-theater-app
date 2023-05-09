import 'package:flutter/material.dart';
import 'package:movie_theater_app/pages/home_page.dart';

class BrowseMoviesButton extends StatelessWidget {
  const BrowseMoviesButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
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
          gradient: const LinearGradient(
            colors: [Color(0xFFf03400), Color(0xFFf04f00)],
          ),
        ),
        child: const Center(
          child: Text(
            'BROWSE MOVIES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              letterSpacing: 0.7,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
