import 'package:flutter/material.dart';
import 'package:movie_theater_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const MyHomePage(),
    );
  }
}
