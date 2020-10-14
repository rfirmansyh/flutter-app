import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/View_Main.dart';
import 'package:flutter_app/views/admin/View_Penjual.dart';

// tempat routes
final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // "/": (context) => View_Main(),
  "/datapenjual": (context) => View_Penjual(),
};
