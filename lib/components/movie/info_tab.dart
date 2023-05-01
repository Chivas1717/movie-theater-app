import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/movie/youtube_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class InfoTab extends StatefulWidget {
  const InfoTab({super.key});

  @override
  State<InfoTab> createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  static const rowSpacer = TableRow(children: [
    SizedBox(
      height: 12,
    ),
    SizedBox(
      height: 12,
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // VideoPlayer(youtubeUrl: 'https://www.youtube.com/watch?v=mqqft2x_Aa4')
          SizedBox(
            height: 1,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.red),
            child: const Center(
              child: Text(
                'Trailer player',
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xb21e283d)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '8.1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'IMDB',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          '143min',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'RUNTIME',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            // height: 70,
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 90),
            child: Column(
              children: [
                const Text(
                  'Чарівний злодій та група умілих авантюристів вирішують здійснити епічне пограбування, щоб повернути втрачену реліквію. Але все йде шкереберть, коли на шляху героїв постає неочікувана перешкода.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Table(
                  children: const [
                    TableRow(children: [
                      Text(
                        "Certificate",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "16 +",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        "Release",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "2022",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        "Genre",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Action, Horror",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        "Director",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Steven Spilberg",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        "Cast",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "Robert Pattinson, Zoë Kravitz, Jeffrey Wright, Colin Farrell, Paul Dano, John Turturro, Andy Serkis, Peter Sarsgaard",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Text(
//             'Чарівний злодій та група умілих авантюристів вирішують здійснити епічне пограбування, щоб повернути втрачену реліквію. Але все йде шкереберть, коли на шляху героїв постає неочікувана перешкода.',
//           ),
