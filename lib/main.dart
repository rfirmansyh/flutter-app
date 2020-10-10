import 'package:flutter/material.dart';
import 'tests/MyApp.dart';

void main() => runApp(MaterialApp (
  debugShowCheckedModeBanner: false,
  theme: ThemeData(primaryColor: Colors.red),
  home: MyApp(),
));

