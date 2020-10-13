import 'package:flutter/widgets.dart';

import 'package:flutter_app/pages/app/Main.dart';
import 'package:flutter_app/pages/app/Developer.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => Main(),
  // "/developer": (context) => Developer(),
};