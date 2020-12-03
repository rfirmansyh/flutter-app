import 'package:flutter/material.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/_base/color.dart';

import 'package:hexcolor/hexcolor.dart';



class Button extends StatelessWidget {
  final String type;
  final String text;
  final Color butonColor;
  final Function onPressed;
  final EdgeInsets margin;

  const Button({
    Key key,
    @required this.type,
    @required this.text,
    @required this.butonColor,
    @required this.onPressed,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.type == 'solid') {
      return Container(
        margin: this.margin,
        child: RaisedButton(
          onPressed: this.onPressed,
          textColor: Colors.white,
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: this.butonColor,
          child: Text(
            this.text,
            style: TextStyle(
              color: color('white'),
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      );
    } else {
      return Container(
        margin: this.margin,
        child: OutlineButton(
          onPressed: this.onPressed,
          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 24, right: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          borderSide: BorderSide(
            color: this.butonColor
          ),
          child: Text(
            this.text,
            style: TextStyle(
              color: this.butonColor,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      );
    }
    
  }
}