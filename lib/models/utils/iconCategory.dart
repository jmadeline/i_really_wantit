import 'package:flutter/material.dart';

class IconCategory extends StatelessWidget {
  final IconData iconDesign;
  final Color colorIcon;
  final Function onPress;

  IconCategory({this.colorIcon, this.iconDesign, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Color(0xfffcfaed),
        shadows: <BoxShadow>[
          BoxShadow(
            color: Colors.yellow[50],
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(2, 4),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: IconButton(
          icon: Icon(
            this.iconDesign,
            color: this.colorIcon,
          ),
          onPressed: this.onPress),
    );
  }
}
