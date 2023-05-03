import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_theater_app/blocs/movies_bloc/movies_bloc.dart';
import 'package:movie_theater_app/pages/home_page.dart';
import 'package:movie_theater_app/pages/login/login_page.dart';

import 'blocs/auth_bloc/auth_bloc.dart';
import 'repositories/repositories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            AuthRepository(),
          ),
        ),
        BlocProvider<MoviesBloc>(
          create: (context) => MoviesBloc(
            MoviesRepository(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'RootUI',
          scaffoldBackgroundColor: const Color(0xff1a2232),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(),
            bodyMedium: TextStyle(),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
          appBarTheme: const AppBarTheme(
            color: Color(0xb21e283d),
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
