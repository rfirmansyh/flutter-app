import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/View_Main.dart';
import 'package:flutter_app/views/member/View_Index.dart' as member;
import 'package:flutter_app/views/member/View_Show.dart' as member;

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => View_Main(),
  "/member": (context) => member.View_Index(),
  "/member/show": (context) => member.View_Show(),
};
