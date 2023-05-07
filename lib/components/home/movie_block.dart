import 'package:flutter/material.dart';
import 'package:movie_theater_app/models/movie_model.dart';

class MovieBlock extends StatelessWidget {
  final MovieModel movie;
  const MovieBlock({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffff7f36),
                  ),
                ),
              ),
              Container(
                height: 230,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(movie.image!),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x3f06080c),
                      offset: Offset(0, 16),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(100, 0, 0, 190),
                  width: double.infinity,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xffff7f36),
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x3fff8036),
                        offset: Offset(0, 4),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        movie.rating!,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          // height: 1.2575,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie.name!,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            movie.genre!,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
