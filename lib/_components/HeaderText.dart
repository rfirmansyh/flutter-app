import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

class HeaderText {

  static Widget Title(String text, {EdgeInsets margin}) {
    return Container(
      margin: (margin == null) ? EdgeInsets.only(bottom: 5) : margin,
      child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: HexColor(Variable.color('dark')),
            fontSize: 16.0,
          )),
    );
  }

  static Widget Subtitle(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Text(text,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: HexColor(Variable.color('secondary')),
            fontSize: 12.0,
          )),
    );
  }

}
