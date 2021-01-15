import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Nunito'),
      initialRoute: '/member/tempats/average',
      routes: routes,
      builder: EasyLoading.init(),
    );
  }
}
