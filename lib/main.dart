import 'package:flutter/material.dart';
import 'package:lottery_ticket_flutter/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   primaryTextTheme: TextTheme()
      // ),
      home: HomeScreen(),
    );
  }
}
