import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/guest/View_Index.dart' as guest;

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/"           : (context) => guest.View_Index(),
};