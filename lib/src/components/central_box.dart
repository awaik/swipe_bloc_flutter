import 'package:flutter/material.dart';

class CentralBox extends StatelessWidget {
  CentralBox({this.title, this.size});

  final String title;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 5.0,
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width / 20),
        child: Container(
          width: size,
          height: size,
          child: Center(
            child: Text(
              title,
              key: Key('counterKey'),
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
