import 'package:flutter/material.dart';
import '../models/game.dart';
import '../models/team.dart';
import '../screens/gamepage.dart';
import '../source.dart';

class GamesGridView extends StatelessWidget {
  const GamesGridView(this.games, {Key? key}) : super(key: key);

  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10.dw),
      shrinkWrap: true,
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      childAspectRatio: 1.6.dw,
      children:
          List.generate(games.length, (index) => _buildGameCard(games[index])),
    );
  }

  _buildGameCard(Game game) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: game.wasPlayed
            ? () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => Gamepage(game)))
            : () {},
        child: Container(
          color: AppColors.surface,
          padding: EdgeInsets.all(10.dw),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(game.status.toUpperCase()),
              _buildTeamDetails(game.homeTeam),
              _buildTeamDetails(game.awayTeam)
            ],
          ),
        ),
      );
    });
  }

  _buildTeamDetails(Team team) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(team.name, style: TextStyle(fontSize: 18.dw)),
            Text('${team.wins} - ${team.losses}',
                style: TextStyle(fontSize: 12.dw, color: Colors.black54))
          ],
        ),
        Text(team.runs,
            style: TextStyle(fontSize: 18.dw, fontWeight: FontWeight.bold))
      ],
    ));
  }
}
