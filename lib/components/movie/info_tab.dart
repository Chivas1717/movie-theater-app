import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_theater_app/components/movie/youtube_player.dart';

import '../../generated/locale_keys.g.dart';
import '../../models/movie_model.dart';

class InfoTab extends StatefulWidget {
  final MovieModel movie;
  const InfoTab({super.key, required this.movie});

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
          const SizedBox(
            height: 1,
          ),
          VideoPlayer(youtubeUrl: widget.movie.trailer!),
          const SizedBox(
            height: 1,
          ),
          // Container(
          //   height: 200,
          //   width: double.infinity,
          //   decoration: const BoxDecoration(color: Colors.red),
          //   child: const Center(
          //     child: Text('Trailer player'),
          //   ),
          // ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xb21e283d)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.movie.rating!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const Text(
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
                      children: [
                        Text(
                          '${widget.movie.duration}min',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          LocaleKeys.RUNTIME.tr(),
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
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 90),
            child: Column(
              children: [
                Text(
                  widget.movie.plot!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        LocaleKeys.Certificate.tr(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${widget.movie.age!}+',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        LocaleKeys.Release.tr(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        '${widget.movie.year!}',
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(
                      children: [
                        Text(
                          LocaleKeys.Genre.tr(),
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          widget.movie.genre!,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        LocaleKeys.Director.tr(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.movie.director!,
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                    rowSpacer,
                    TableRow(children: [
                      Text(
                        LocaleKeys.Cast.tr(),
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        widget.movie.starring!,
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
