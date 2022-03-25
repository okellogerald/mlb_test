import 'package:flutter/material.dart';
import 'package:mlb_test1/Widgets/matches_grid_view.dart';
import 'package:mlb_test1/models/payload.dart';
import 'package:mlb_test1/service/service.dart';
import '../Widgets/bottom_navigation_bar.dart';
import '../models/game.dart';

class Matches extends StatefulWidget {
  const Matches({Key? key}) : super(key: key);

  @override
  _MatchesState createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  late DateTime _myDate;

  late Future<PayLoad> futurePayload;

  @override
  //called the getData() method in initState()
  void initState() {
    super.initState();
    futurePayload = getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo.shade900,
        leading: const Icon(Icons.menu),
        title: const Text(
          "Scoreboard",
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.headphones,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.desktop_windows,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(children: <Widget>[
        AppBar(
          backgroundColor: Colors.indigo.shade900,
          // leading: const Icon(Icons.calendar_today),
          leading: IconButton(
            icon: Icon(
              Icons.calendar_today,
              color: Colors.white,
            ),
            //TODO implement datePicker to show list of games for selected date
            onPressed: () async {

              _myDate = (await showDatePicker(
                context: context,
                initialDate: DateTime(2014),
                firstDate: DateTime(2014),
                lastDate: DateTime(2022),
              ))!;
              setState(() {});
              dates.day = _myDate.day.toString().padLeft(2,'0');
              dates.month = _myDate.month.toString().padLeft(2,'0');
              dates.year = _myDate.year.toString();
            },
          ),

          actions: [
            IconButton(
              icon: const Icon(
                Icons.grid_view,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 585,
          //Display the asynchronous Data in a FutureBuilder
          child: FutureBuilder<PayLoad>(
            future: futurePayload,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Game> matches = snapshot.data!.data.games.game;
                if (matches.isEmpty) {
                  return Container(
                    child: Text('No games today'),
                  );
                } else {
                  return MatchesGridView(matches: matches);
                }
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
