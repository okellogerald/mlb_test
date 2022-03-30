import 'package:mlb_test1/widgets/app_divider.dart';
import '../models/batter.dart';
import '../models/batter_details.dart';
import '../source.dart';

class TeamStatsTable extends StatelessWidget {
  const TeamStatsTable(
      {required this.teamBatters, required this.teamBatterDetails, Key? key})
      : super(key: key);

  final BatterDetails teamBatterDetails;
  final List<Batter> teamBatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.dh,
          width: 292.dw,
          // color: AppColors.primary,
          alignment: Alignment.center,
          child: Text('BATTERS',
              style: TextStyle(
                  color: AppColors.onBackground,
                  fontSize: 14.dw,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: ScreenSizeConfig.getFullWidth,
          margin: EdgeInsets.symmetric(horizontal: 10.dw),
          height: 263.dh,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1.dw),
                  top: BorderSide(width: 1.dw))),
          child: Row(
            children: [
              _buildBatterMeasures(),
              _buildPlayerStats(),
              _buildTeamStats()
            ],
          ),
        ),
      ],
    );
  }

  static const labels = ['', 'AB', 'R', 'H', 'RBI', 'BB', 'AVG', 'OBP', 'SLG'];

  _buildBatterMeasures() {
    return Container(
      width: 50.dw,
      color: AppColors.primary,
      child: Column(
        children: labels
            .map((e) => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 5.dh),
                    Text(e,
                        style: TextStyle(
                            color: AppColors.onPrimary, fontSize: 14.dh)),
                    e == 'SLG'
                        ? Container()
                        : AppDivider(margin: EdgeInsets.only(top: 5.dh))
                  ],
                ))
            .toList(),
      ),
    );
  }

  _buildPlayerStats() {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: teamBatters
            .map((batter) => SizedBox(
                  width: 100.dw,
                  child: Column(children: [
                    _buildPlayerDetails(batter.shortName),
                    _buildPlayerDetails(batter.details.ab),
                    _buildPlayerDetails(batter.details.r),
                    _buildPlayerDetails(batter.details.h),
                    _buildPlayerDetails(batter.details.rbi),
                    _buildPlayerDetails(batter.details.bb),
                    _buildPlayerDetails(batter.details.avg),
                    _buildPlayerDetails(batter.details.obp),
                    _buildPlayerDetails(batter.details.slg, true)
                  ]),
                ))
            .toList(),
      ),
    );
  }

  _buildTeamStats() {
    return Container(
      width: 50.dw,
      color: AppColors.primary,
      child: Column(
        children: [
          _buildTeamDetails('TEAM'),
          _buildTeamDetails(teamBatterDetails.ab),
          _buildTeamDetails(teamBatterDetails.r),
          _buildTeamDetails(teamBatterDetails.h),
          _buildTeamDetails(teamBatterDetails.rbi),
          _buildTeamDetails(teamBatterDetails.bb),
          _buildTeamDetails(teamBatterDetails.avg),
          _buildTeamDetails(teamBatterDetails.obp),
          _buildTeamDetails(teamBatterDetails.slg, true)
        ],
      ),
    );
  }

  _buildPlayerDetails(String value, [bool isLast = false]) {
    return Column(
      children: [
        SizedBox(height: 5.dh),
        Text(value, style: TextStyle(fontSize: 14.dh)),
        isLast ? Container() : AppDivider(margin: EdgeInsets.only(top: 5.dh))
      ],
    );
  }

  _buildTeamDetails(String value, [bool isLast = false]) {
    return Column(
      children: [
        SizedBox(height: 5.dh),
        Text(value,
            style: TextStyle(color: AppColors.onPrimary, fontSize: 14.dh)),
        isLast ? Container() : AppDivider(margin: EdgeInsets.only(top: 5.dh))
      ],
    );
  }
}
