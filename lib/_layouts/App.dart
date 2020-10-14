import 'package:flutter/material.dart';

import 'package:flutter_app/_routes/AppRoutes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      initialRoute: '/datapenilaian',
      routes: routes,
    );
  }
  children(Text text, Text text2) {}
}


