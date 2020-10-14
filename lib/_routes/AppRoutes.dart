import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/View_Main.dart';
import 'package:flutter_app/views/user/View_Penjual.dart';
import 'package:flutter_app/views/user/View_Penilaian.dart';
// tempat routes
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/datapenjual": (context) => View_Penjual(),
  "/datapenilaian": (context) => View_Penilaian(),
};