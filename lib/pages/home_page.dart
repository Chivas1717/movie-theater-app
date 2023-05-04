import 'dart:developer';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_bloc.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_event.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_state.dart';
import 'package:movie_theater_app/components/home/login_btn.dart';
import 'package:movie_theater_app/components/home/movies_list.dart';
import 'package:movie_theater_app/models/movie_model.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_state.dart';
import '../utils/secure_storage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String searchValue = '';
  String dateValue = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void onTapDateField() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(
        pickedDate,
      );

      setState(() {
        dateController.text = formattedDate;
        dateValue = formattedDate;
      });
    } else {
      print("Date is not selected");
    }
  }

  void searchMovies() {
    setState(() {
      searchValue = _searchController.text;
    });
  }

  @override
  void initState() {
    dateController.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, AuthState authState) {
        if (authState is AuthLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (authState is AuthErrorState) {
          return Scaffold(
            body: Center(
              child: Text(authState.error.toString()),
            ),
          );
        } else {
          void refreshMovies() {
            context.read<MoviesBloc>().add(
                  LoadMoviesEvent(
                    searchValue: searchValue,
                    dateValue: dateValue,
                  ),
                );
          }

          refreshMovies();
          return BlocBuilder<MoviesBloc, MoviesState>(
            builder: (context, MoviesState moviesState) {
              if (moviesState is MoviesLoadingState) {
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (moviesState is MoviesErrorState) {
                return Scaffold(
                  body: Center(
                    child: Text(moviesState.error.toString()),
                  ),
                );
              } else if (moviesState is MoviesLoadedState) {
                List<MovieModel> movies = moviesState.movies;
                return Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(
                        'assets/imgs/appbar_logo.png',
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    actions: [
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.language_rounded,
                                  size: 30,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text(
                                      'Eng',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      'Ukr',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            LoginBtn()
                          ],
                        ),
                      ),
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 8.0),
                              child: Container(
                                child: TextField(
                                  style: TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: _searchController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(color: Colors.white),
                                    suffixStyle: TextStyle(color: Colors.white),
                                    hintText: 'Search...',
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                      ),
                                      onPressed: () =>
                                          _searchController.clear(),
                                    ),
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        searchMovies();
                                      },
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: .3,
                                        color:
                                            Color.fromARGB(255, 223, 213, 207),
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xfffc6c19),
                                      ),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Now in cinemas',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Expanded(
                                    child: TextField(
                                        readOnly: true,
                                        controller: dateController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.calendar_today),
                                          labelText: "Enter Date",
                                        ),
                                        onTap: onTapDateField),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MoviesList(movies: movies, mainDate: dateValue),
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
      },
    );
  }
}
