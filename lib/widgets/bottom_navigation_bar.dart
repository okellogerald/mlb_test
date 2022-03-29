import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

 static final _selectedTabIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
        valueListenable: _selectedTabIndexNotifier,
        builder: (context, selectedIndex, child) {
          return BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: _updateIndex,
            items: [
              _buildItem(Icons.scoreboard, 'Scores'),
              _buildItem(Icons.newspaper, 'News'),
              _buildItem(Icons.flag, 'Standings'),
              _buildItem(Icons.bar_chart, 'Stats'),
            ],
          );
        });
  }

  _buildItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }

  _updateIndex(int currentIndex) =>
      _selectedTabIndexNotifier.value = currentIndex;
}
