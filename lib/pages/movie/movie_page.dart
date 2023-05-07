import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_theater_app/components/movie/info_tab.dart';
import 'package:movie_theater_app/components/movie/sessions_tab.dart';
import 'package:movie_theater_app/models/movie_model.dart';

class MoviePage extends StatefulWidget {
  final MovieModel movie;
  final String mainDate;
  const MoviePage({super.key, required this.movie, required this.mainDate});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // static final List<Widget> _widgetOptions = <Widget>[
  //   InfoTab(movie: widget.movie),
  //   SessionsTab()
  // ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: .2)),
          centerTitle: true,
          title: Text(
            widget.movie.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          bottom: TabBar(
            labelColor: const Color(0xffff7f36),
            unselectedLabelColor: Color.fromARGB(255, 106, 108, 116),
            controller: _controller,
            indicatorColor: const Color(0xffff7f36),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: Color.fromARGB(255, 106, 108, 116),
            ),
            tabs: const [
              Tab(
                text: 'About',
              ),
              Tab(
                text: 'Sessions',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            InfoTab(movie: widget.movie),
            SessionsTab(
              mainDate: widget.mainDate,
              movie: widget.movie,
            )
          ],
          controller: _controller,
        ),
        floatingActionButton: _selectedIndex == 0
            ? Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 60.0,
                decoration: BoxDecoration(
                  color: const Color(0xffff7f36),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: RawMaterialButton(
                  shape: CircleBorder(),
                  elevation: 0.0,
                  child: Text(
                    'Sessions',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  onPressed: () {
                    _controller.animateTo(_selectedIndex += 1);
                  },
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.abc),
        //   onPressed: () {
        //     _controller.animateTo(1);
        //   },
        // ),
      ),
    );
  }
}
