import 'package:flutter/material.dart';
import 'package:pawdopt/screens/historyscreen.dart';
import 'package:pawdopt/screens/homescreen.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/second': (context) => const HistoryScreen(),
      },
    );
  }
}
