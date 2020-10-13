import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: HexColor(Variable.color('primary')),
            child: Text('asdfk'),
          )
        ],
      ),
    );
  }
}