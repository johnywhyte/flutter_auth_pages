import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;
  MyButton({this.name, this.onPressed});
@override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: RaisedButton(
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        color: Colors.blue[800],
        onPressed: onPressed,

      ),
    );
  }
}
