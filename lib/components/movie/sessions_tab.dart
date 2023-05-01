import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SessionsTab extends StatefulWidget {
  const SessionsTab({super.key});

  @override
  State<SessionsTab> createState() => _SessionsTabState();
}

class _SessionsTabState extends State<SessionsTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xb21e283d)),
            child: Row(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Color.fromARGB(255, 106, 108, 116),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'April, 18',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: Color.fromARGB(255, 106, 108, 116),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          'Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(
                decoration: BoxDecoration(
                  color: Color(0xff253454),
                ),
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
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
                    padding: EdgeInsets.all(5),
                    child: Center(
                        child: Text(
                      'Adult',
                      style: TextStyle(
                        color: Color.fromARGB(255, 106, 108, 116),
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Child',
                        style: TextStyle(
                          color: Color.fromARGB(255, 106, 108, 116),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'Student',
                        style: TextStyle(
                          color: Color.fromARGB(255, 106, 108, 116),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: Center(
                      child: Text(
                        'VIP',
                        style: TextStyle(
                          color: Color.fromARGB(255, 106, 108, 116),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              for (var i = 0; i < 8; i++)
                TableRow(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: .2,
                        color: Color.fromARGB(255, 106, 108, 116),
                      ),
                    ),
                  ),
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Column(
                        children: [
                          Text(
                            '14:40',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'IMAX',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Center(
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
                      child: Center(
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
                      child: Center(
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
                      child: Center(
                        child: Text(
                          '15',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
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
}
