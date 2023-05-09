import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_theater_app/blocs/sessions_bloc/sessions_bloc.dart';
import 'package:movie_theater_app/blocs/sessions_bloc/sessions_event.dart';
import 'package:movie_theater_app/blocs/sessions_bloc/sessions_state.dart';
import 'package:movie_theater_app/models/movie_model.dart';
import 'package:movie_theater_app/models/session_model.dart';
import 'package:movie_theater_app/pages/movie/theater_page.dart';

class SessionsTab extends StatefulWidget {
  final String mainDate;
  final MovieModel movie;
  const SessionsTab({super.key, required this.mainDate, required this.movie});
  @override
  State<SessionsTab> createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab> {
  final TextEditingController dateController = TextEditingController();
  bool sortAsc = true;

  String dateValue = '';
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
      refreshSessions();
    } else {
      print("Date is not selected");
    }
  }

  void refreshSessions() {
    context.read<SessionsBloc>().add(
          LoadSessionsEvent(
            movieId: '${widget.movie.id}',
            dateValue: dateValue,
          ),
        );
  }

  void getSessionPrices() {}

  String convertDate(int date) {
    DateTime sessionDateTime = DateTime.fromMillisecondsSinceEpoch(date * 1000);
    String formattedTime =
        '${sessionDateTime.hour.toString().padLeft(2, '0')}:${sessionDateTime.minute.toString().padLeft(2, '0')}';
    return formattedTime;
  }

  @override
  void initState() {
    dateValue = widget.mainDate;
    dateController.text = widget.mainDate;
    refreshSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionsBloc, SessionsState>(
      builder: (context, sessionsState) {
        if (sessionsState is SessionsLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (sessionsState is SessionsErrorState) {
          return Scaffold(
            body: Center(
              child: Text(sessionsState.error.toString()),
            ),
          );
        } else if (sessionsState is SessionsLoadedState) {
          List<SessionModel> sessions = sessionsState.sessions;
          if (sortAsc) {
            sessions.sort((a, b) {
              var value1 = convertDate(a.date!);
              var value2 = convertDate(b.date!);
              return value1.compareTo(value2);
            });
          } else {
            sessions.sort((b, a) {
              var value1 = convertDate(a.date!);
              var value2 = convertDate(b.date!);
              return value1.compareTo(value2);
            });
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xb21e283d)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: GestureDetector(
                            onTap: onTapDateField,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.calendar_month,
                                  color: Color.fromARGB(255, 106, 108, 116),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  dateController.text,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              sortAsc = !sortAsc;
                            });
                          },
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.timelapse,
                                  color: Color.fromARGB(255, 106, 108, 116),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Time ${sortAsc ? '↓' : '↑'}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Table(
                  columnWidths: const {
                    0: FlexColumnWidth(1.5),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                    4: FlexColumnWidth(1.5),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    TableRow(
                      decoration: const BoxDecoration(
                        color: Color(0xff253454),
                      ),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'Time',
                              style: TextStyle(
                                color: Color.fromARGB(255, 106, 108, 116),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                              child: Text(
                            'Normal',
                            style: TextStyle(
                              color: Color.fromARGB(255, 106, 108, 116),
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'Comfort',
                              style: TextStyle(
                                color: Color.fromARGB(255, 106, 108, 116),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              'VIP',
                              style: TextStyle(
                                color: Color.fromARGB(255, 106, 108, 116),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Center(
                            child: Text(
                              '',
                              style: TextStyle(
                                color: Color.fromARGB(255, 106, 108, 116),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var i = 0; i < sessions.length; i++)
                      TableRow(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: .2,
                              color: Color.fromARGB(255, 106, 108, 116),
                            ),
                          ),
                        ),
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              children: [
                                Text(
                                  convertDate(sessions[i].date!),
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  sessions[i].type!,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: const Center(
                              child: Text(
                                '15',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TheaterPage(
                                        session: sessions[i],
                                        movie: widget.movie);
                                  },
                                ),
                              );
                            },
                            child: Container(
                              child: Center(
                                child: Container(
                                  height: 28,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(
                                      begin: Alignment(0, -1),
                                      end: Alignment(0, 1),
                                      colors: <Color>[
                                        Color(0xffff8036),
                                        Color(0xfffc6c19)
                                      ],
                                      stops: <double>[0, 1],
                                    ),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x3fff8036),
                                        offset: Offset(0, 4),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Preview',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                )
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
