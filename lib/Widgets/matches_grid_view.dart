import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/game.dart';

class MatchesGridView extends StatelessWidget {
  const MatchesGridView({
    Key? key,
    required this.matches,
  }) : super(key: key);

  final List<Game> matches;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: List.generate(
          matches.length,
              (index) => Container(
            decoration: const BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.01, offset: Offset(0, 1))
                ]),
            width: 190,
            height: 165,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 10.0, right: 100),
                  width: 50,
                  height: 20,
                  // color: Colors.black,
                  child: Text(
                    matches[index]
                        .status
                        .status
                        .toUpperCase(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 15),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 30,
                        // color: Colors.blue,
                        child: Text(
                          matches[index].homeTeamName,
                          style: GoogleFonts.openSans(
                            // fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 5.0, top: 10),
                        width: 30,
                        height: 20,
                        // color: Colors.teal,
                        child: Text(
                          matches[index].linescore.r.home,
                          style: GoogleFonts.secularOne(
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, top: 25),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 30,
                        // color: Colors.blue
                        child: Text(
                          matches[index].awayTeamName,
                          style: GoogleFonts.openSans(
                            // fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                              fontSize: 18,),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: 5.0, top: 10),
                        width: 30,
                        height: 20,
                        // color: Colors.teal,
                        child: Text(
                          matches[index].linescore.r.away,
                          style: GoogleFonts.secularOne(
                              fontSize: 20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}