import 'package:flutter/material.dart';
import 'package:mlb_test1/screens/homepage.dart';
import 'package:mlb_test1/themes/app_theme.dart';
import 'widgets/screen_size_init.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenSizeInit(
      designSize: const Size(411.4, 866.3),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        home: const Homepage(),
      ),
    );
  }
}
