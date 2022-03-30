import '../source.dart';
import 'app_material_button.dart';

class TeamsSwitcher extends StatefulWidget {
  const TeamsSwitcher(
      {Key? key,
      required this.homeTeamName,
      required this.awayTeamName,
      required this.onTeamsSwitched})
      : super(key: key);

  final String homeTeamName, awayTeamName;
  final ValueChanged<bool> onTeamsSwitched;

  @override
  _TeamsSwitcherState createState() => _TeamsSwitcherState();
}

class _TeamsSwitcherState extends State<TeamsSwitcher> {
  bool isHomeSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(15.dw, 10.dh, 15.dw, 10.dh),
      decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15.dw))),
      child: Row(
        children: [
          _buildTeamName(widget.homeTeamName, isHomeSelected),
          _buildTeamName(widget.awayTeamName, !isHomeSelected),
        ],
      ),
    );
  }

  _buildTeamName(String value, bool isSelected) {
    return Expanded(
      child: GestureDetector(
        onTap: _updateIndex,
        child: Container(
            alignment: Alignment.center,
            height: 40.dh,
            decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15.dw))),
            child: Text(value,
                style: TextStyle(
                    color: isSelected
                        ? AppColors.onPrimary
                        : AppColors.onBackground2))),
      ),
    );
  }

  _updateIndex() {
    isHomeSelected = !isHomeSelected;
    widget.onTeamsSwitched(isHomeSelected);
    setState(() {});
  }
}
