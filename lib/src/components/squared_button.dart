import 'package:flutter/material.dart';

class SquaredButton extends StatelessWidget {
  SquaredButton({this.title, this.onPressed, this.buttonKey});

  final String title;
  final Function onPressed;
  final String buttonKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        child: Material(
          elevation: 1.0,
          color: Color(0x66FFFFFF),
          borderRadius: BorderRadius.circular(5.0),
          child: MaterialButton(
            key: Key(buttonKey),
            onPressed: onPressed,
            minWidth: 22.0,
            height: 22.0,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
