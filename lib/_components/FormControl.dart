import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

class FormControl {
  static Widget TextArea({
    @required String label,
    String hintText,  
  }) {
    return TextField(
      maxLines: null,
      minLines: 6,
      keyboardType: TextInputType.multiline,
      textAlignVertical: TextAlignVertical.top,
      style: TextStyle(
        color: HexColor(Variable.color('dark')),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        labelText: label,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: HexColor(Variable.color('secondary')),
            fontSize: 14.0),
        isDense: true,
        hintText: hintText == '' ? 'Type Input' : hintText,
        hintStyle: TextStyle(
            color: HexColor(Variable.color('secondary')), fontSize: 14.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: HexColor(Variable.color('primary'))),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      ),
    );
  }
}