import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

class View_Penjual extends StatefulWidget {
  @override
  _View_PenjualState createState() => _View_PenjualState();
}

class _View_PenjualState extends State<View_Penjual> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
      endDrawer: Sidebar(onIconTap: () {}),
      body: Container(
        color: Colors.blue,
        child: Text("Hello World"),
      )
    );
  }
}
