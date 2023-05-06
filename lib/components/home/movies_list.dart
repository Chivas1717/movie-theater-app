import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/home/movie_block.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/pages/movie/movie_page.dart';

class MoviesList extends StatefulWidget {
  final List<MovieModel> movies;
  final String mainDate;
  const MoviesList({super.key, required this.movies, required this.mainDate});

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
        for (int i = 0; i < widget.movies.length; i++)
          GestureDetector(
            child: MovieBlock(movie: widget.movies[i]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return MoviePage(
                        movie: widget.movies[i], mainDate: widget.mainDate);
                  },
                ),
              );
            },
          )
      ],
    );
  }
}
