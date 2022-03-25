import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedLabelStyle: TextStyle(color: Colors.black),
      elevation: 0,
      // backgroundColor: Colors.white,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.newspaper,color: Colors.black,), label: 'News',),
        BottomNavigationBarItem(icon: Icon(Icons.scoreboard,color: Colors.black), label: 'Scores'),
        BottomNavigationBarItem(icon: Icon(Icons.flag,color: Colors.black), label: 'Hey'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart,color: Colors.black), label: 'Stats',backgroundColor: Colors.black),

      ],
    );
  }
}
