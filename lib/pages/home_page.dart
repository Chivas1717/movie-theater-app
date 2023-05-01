import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_theater_app/components/home/login_btn.dart';
import 'package:movie_theater_app/components/home/movies_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Container(
                  child: Row(
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
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            'Ukr',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                LoginBtn(text: 'Log in')
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
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Now in cinemas',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                        // style: GoogleFonts.nunito(fontSize: 30),
                      ),
                      Icon(
                        Icons.search,
                        size: 30,
                        color: Color.fromARGB(255, 106, 108, 116),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MoviesList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
