import 'package:flutter/material.dart';

class CounterData extends StatefulWidget {
  static String id = 'counter_data';
  @override
  _CounterDataState createState() => _CounterDataState();
}

class _CounterDataState extends State<CounterData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter data screen'),
        backgroundColor: Color(0xFF3D9098),
      ),
      body: Center(
        child: Text('11111'),
      ),
    );
  }
}
