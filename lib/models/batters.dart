import 'package:mlb_test1/models/batter_details.dart';

import 'batter.dart';

class Batters {
  final List<Batter> homeTeamBatters, awayTeamBatters;
  final BatterDetails homeTeamTotals, awayTeamTotals;

  const Batters(
      {required this.awayTeamBatters,
      required this.awayTeamTotals,
      required this.homeTeamBatters,
      required this.homeTeamTotals});
}
