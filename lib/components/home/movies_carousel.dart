import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/models/movie_model.dart';

import '../../pages/movie_page.dart';

class MoviesCarousel extends StatefulWidget {
  final List<MovieModel> movies;
  const MoviesCarousel({super.key, required this.movies});

  @override
  State<MoviesCarousel> createState() => _MoviesCarouselState();
}

class _MoviesCarouselState extends State<MoviesCarousel> {
  final CarouselController _carouselController = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(widget.movies[_current].image!, fit: BoxFit.cover),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                      Colors.grey.shade50.withOpacity(0.0),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 500.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.70,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                carouselController: _carouselController,
                items: widget.movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SingleChildScrollView(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return MoviePage(
                                        movie: movie,
                                        mainDate: DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now()),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: EdgeInsets.only(top: 30),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.network(movie.image!,
                                        fit: BoxFit.cover),
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    movie.name!,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // rating
                                  SizedBox(height: 20),
                                  Container(
                                    child: Text(
                                      movie.genre!,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey.shade600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 500),
                                    opacity:
                                        _current == widget.movies.indexOf(movie)
                                            ? 1.0
                                            : 0.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  movie.rating!,
                                                  style: TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.grey.shade600,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.access_time,
                                                  color: Colors.grey.shade600,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '${movie.duration!}min',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.grey.shade600),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.play_circle_filled,
                                                  color: Colors.grey.shade600,
                                                  size: 20,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  'Watch',
                                                  style: TextStyle(
                                                      fontSize: 14.0,
                                                      color:
                                                          Colors.grey.shade600),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
