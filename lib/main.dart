import 'package:flutter/material.dart';
import 'package:test_swipes/src/screens/swipe/swipe_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwipeScreen(),
    );
  }
}
