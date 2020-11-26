import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ButtonMenu extends StatelessWidget {
  final Function onPress;

  ButtonMenu({this.onPress});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Ink(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff86CECB),
                Color(0xff9684BE),
              ],
            )),
        child: Icon(
          Icons.add,
          size: 40,
        ),
      ),
      onPressed: this.onPress,
    );
  }
}
