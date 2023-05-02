import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/home/movie_block.dart';
import 'package:movie_theater_app/pages/movie_page.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({super.key});

  @override
  State<MoviesList> createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 32,
      runSpacing: 20,
      children: [
        for (int i = 0; i < 7; i++)
          GestureDetector(
            child: const MovieBlock(),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MoviePage();
                  },
                ),
              );
            },
          )
      ],
    );
  }
}
