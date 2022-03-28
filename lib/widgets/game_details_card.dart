import 'package:mlb_test1/widgets/app_divider.dart';
import '../models/game.dart';
import '../models/patcher.dart';
import '../models/team.dart';
import '../source.dart';

class GameDetailsCard extends StatelessWidget {
  const GameDetailsCard(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.dw),
      margin: EdgeInsets.all(10.dw),
      decoration: BoxDecoration(
          color: const Color(0xffEBDCCB),
          borderRadius: BorderRadius.all(Radius.circular(10.dw))),
      child: Column(
        children: [
          _buildTeamsDetails(),
          const AppDivider(),
          _buildPatchers(),
          const AppDivider(),
          _buildLiningScore()
        ],
      ),
    );
  }

  _buildTeamsDetails() {
    return SizedBox(
      height: 140.dh,
      width: 380.dw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(game.venue,
              style: const TextStyle(color: AppColors.onBackground2)),
          SizedBox(height: 8.dh),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTeamDetails(game.homeTeam),
                    SizedBox(height: 8.dh),
                    _buildTeamDetails(game.awayTeam),
                  ],
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(game.status.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTeamDetails(Team team) {
    return SizedBox(
        width: 250.dw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(team.name,
                    style: TextStyle(
                        fontSize: 24.dw, fontWeight: FontWeight.bold)),
                Text('${team.wins} - ${team.losses}',
                    style: TextStyle(fontSize: 16.dw, color: Colors.black54))
              ],
            ),
            Text(team.runs,
                style: TextStyle(fontSize: 24.dw, fontWeight: FontWeight.bold))
          ],
        ));
  }

  _buildPatchers() {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 2.8.dw,
      padding: EdgeInsets.only(top: 8.dh),
      shrinkWrap: true,
      children: List.generate(
          game.patchers.length, (index) => _buildPatcher(game.patchers[index])),
      physics: const NeverScrollableScrollPhysics(),
    );
  }

  _buildPatcher(Patcher patcher) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(patcher.type),
        Text(patcher.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.dw)),
        Row(
          children: [
            Text('${patcher.wins} - ${patcher.losses} | ${patcher.era} ERA')
          ],
        )
      ],
    );
  }

  _buildLiningScore() {
    final homeTeam = game.homeTeam;
    final awayTeam = game.awayTeam;
    return Row(
      children: [
        _buildScore('', homeTeam.name.substring(0, 3).toUpperCase(),
            awayTeam.name.substring(0, 3).toUpperCase()),
        _buildInningsGrid(),
        AppDivider(height: 55.dh, width: 1.5),
        _buildScores()
      ],
    );
  }

  _buildScores() {
    final homeTeam = game.homeTeam;
    final awayTeam = game.awayTeam;
    return SizedBox(
      height: 55.dh,
      width: 80.dw,
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          _buildScore('R', homeTeam.runs, awayTeam.runs),
          _buildScore('H', homeTeam.hits, awayTeam.hits),
          _buildScore('E', homeTeam.errors, awayTeam.errors),
        ],
      ),
    );
  }

  _buildScore(String title, String homeTeamValue, String awayTeamValue) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.dw),
      child: Column(
        children: [Text(title), Text(homeTeamValue), Text(awayTeamValue)],
      ),
    );
  }

  _buildInningsGrid() {
    return SizedBox(
      width: 230.dw,
      height: 55.dh,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: List.generate(
              game.innings.length, (index) => _buildInning(index))),
    );
  }

  _buildInning(int index) {
    final inning = game.innings[index];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.dw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('${index + 1}',
              style: const TextStyle(color: AppColors.onBackground2)),
          Text(inning.home,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.onBackground)),
          Text(inning.away,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: AppColors.onBackground))
        ],
      ),
    );
  }
}
