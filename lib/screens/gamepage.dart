import 'package:mlb_test1/widgets/game_details_card.dart';
import 'package:mlb_test1/service.dart' as service;
import 'package:mlb_test1/widgets/team_batters_details.dart';
import 'package:mlb_test1/widgets/teams_switcher.dart';
import '../models/batters.dart';
import '../models/game.dart';
import '../source.dart';

class Gamepage extends StatefulWidget {
  const Gamepage(this.game, {Key? key}) : super(key: key);

  final Game game;

  @override
  State<Gamepage> createState() => _GamepageState();
}

class _GamepageState extends State<Gamepage> {
  final isHomeTeamSelectedNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: ListView(children: [
          GameDetailsCard(widget.game),
          Padding(
            padding: EdgeInsets.only(left: 15.dw, top: 10.dh),
            child: Text('Team Stats',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.dw)),
          ),
          TeamsSwitcher(
              homeTeamName: widget.game.homeTeam.name,
              awayTeamName: widget.game.awayTeam.name,
              onTeamsSwitched: _onTeamsSwitched),
          _buildBatterDetails()
        ]));
  }

  _buildAppBar() {
    return AppBar(
      title:
          Text('${widget.game.homeTeam.name} VS ${widget.game.awayTeam.name}'),
      actions: [
        AppIconButton(icon: Icons.headphones, onPressed: () {}),
        AppIconButton(
            icon: Icons.desktop_windows,
            onPressed: () {},
            margin: EdgeInsets.symmetric(horizontal: 15.dw))
      ],
    );
  }

  _buildBatterDetails() {
    return FutureBuilder<Batters>(
        future: service.getBothTeamsBatters(widget.game.gameDateDirectory),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final batters = snapshot.data!;
            return ValueListenableBuilder<bool>(
                valueListenable: isHomeTeamSelectedNotifier,
                builder: (_, isHomeTeamSelected, child) {
                  return TeamBatterDetailsTable(
                      teamBatters: isHomeTeamSelected
                          ? batters.homeTeamBatters
                          : batters.awayTeamBatters,
                      teamBatterDetails: isHomeTeamSelected
                          ? batters.homeTeamTotals
                          : batters.awayTeamTotals);
                });
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  _onTeamsSwitched(bool currentValue) {
    isHomeTeamSelectedNotifier.value = currentValue;
  }
}
