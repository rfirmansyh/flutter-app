import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

import 'package:flutter_app/_routes/AppRoutes.dart';

// import 'AppBar.dart';
// import '../auth/Login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      initialRoute: '/',
      routes: routes,
    );
  }
  children(Text text, Text text2) {}
}


