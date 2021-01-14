
import 'package:flutter/widgets.dart';
import 'package:flutter_app/views/CameraCoba.dart';
import 'package:flutter_app/views/CameraPreview.dart';

import 'package:flutter_app/views/View_Main.dart';
import 'package:flutter_app/views/member/View_Index.dart' as member;
import 'package:flutter_app/views/member/View_Show.dart' as member;
import 'package:flutter_app/views/user/View_Explore.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (context) => View_Main(),
  "/member": (context) => member.View_Index(),
  "/member/show": (context) => member.View_Show(),
  "/explore" : (context) => View_Explore(),
  "/camerapreview" : (context) => CameraPreview(),
  "/cameracoba" : (context) => CameraCoba(),
};
