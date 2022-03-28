import 'package:mlb_test1/source.dart';
import 'package:mlb_test1/widgets/date_picker.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar(
      { required this.onDateSelected, Key? key})
      : super(key: key);
  final ValueChanged<DateTime> onDateSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      padding: EdgeInsets.fromLTRB(15.dw, 12.dh, 15.dh, 12.dh),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_buildLeading(), _buildActions()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DatePicker(
                  onDateSelected: onDateSelected),
              AppIconButton(icon: Icons.grid_view, onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  _buildLeading() {
    return Row(
      children: [
        AppIconButton(icon: Icons.menu, onPressed: () {}),
        SizedBox(width: 15.dw),
        Text("Scoreboard",
            style: TextStyle(fontSize: 20.dw, color: AppColors.onPrimary))
      ],
    );
  }

  _buildActions() {
    return Row(
      children: [
        AppIconButton(
            icon: Icons.headphones,
            onPressed: () {},
            margin: EdgeInsets.only(right: 10.dw)),
        AppIconButton(icon: Icons.desktop_windows, onPressed: () {})
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(90.dh);
}
