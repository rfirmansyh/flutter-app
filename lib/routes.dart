import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/guest/View_Index.dart' as guest;
import 'package:flutter_app/views/auth/View_Login.dart' as auth;
import 'package:flutter_app/views/auth/View_Register.dart' as auth;
// TEMPAT
import 'package:flutter_app/views/tempats/View_Index.dart' as tempats;
import 'package:flutter_app/views/tempats/View_Show.dart' as tempats;

import 'package:flutter_app/tests/ImagePickerTest.dart' as test;


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  // AUTH
  "/"           : (context) => guest.View_Index(),
  "/login"           : (context) => auth.View_login(),
  "/register"           : (context) => auth.View_Register(),

  // TEMPAT
  "/tempats"    : (context) => tempats.View_Index(),
  "/tempats/show"    : (context) => tempats.View_Show(),

  // TESTING
  "/test/imagepick"           : (context) => test.ImagePickerTest(),
};