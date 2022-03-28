import 'package:mlb_test1/widgets/app_top_bar.dart';
import '../source.dart';
import 'package:mlb_test1/widgets/matches_grid_view.dart';
import '../widgets/app_future_builder.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../models/game.dart';
import 'package:mlb_test1/service.dart' as service;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var selectedDate = DateTime(2015, 7, 28);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
          bottomNavigationBar: const BottomNavBar(),
        ),
      ),
    );
  }

  _buildAppBar() {
    _onDateSelected(DateTime date) {
      selectedDate == date;
      setState(() {});
    }

    return AppTopBar(onDateSelected: _onDateSelected);
  }

  _buildBody() {
    return AppFutureBuilder<List<Game>>(
      future: service.getGames(selectedDate),
      onLoadedWidget: (games) {
        if (games.isEmpty) {
          return const Text('No games today');
        } else {
          return GamesGridView(games);
        }
      },
    );
  }
}
