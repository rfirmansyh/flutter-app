import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/color.dart';

class Sidebar extends StatelessWidget {
  Widget child;
  Sidebar({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.7;

    return Container(
      width: sidebarSize,
      height: mediaQuery.height,
      child: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 24.0),
          child: this.child
        ),
      ),
    );
  }
}
