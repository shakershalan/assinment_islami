import 'package:flutter/material.dart';
import 'package:untitled/Home/home_screen.dart';
import 'package:untitled/Home/quran/sura_screen.dart';
import 'package:untitled/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraScreen.routeName: (context) => SuraScreen(),
      },
    );
  }
}
