import 'package:flutter/widgets.dart';

import 'package:flutter_app/views/guest/View_Index.dart' as guest;

import 'package:flutter_app/views/auth/CheckAuth.dart' as auth;
import 'package:flutter_app/views/auth/View_Login.dart' as auth;
import 'package:flutter_app/views/auth/View_Register.dart' as auth;

// MEMBER TEMPAT
import 'package:flutter_app/views/member/tempats/View_Index.dart' as member_tempats;
import 'package:flutter_app/views/member/tempats/View_Show.dart' as member_tempats;

// ADMIN
import 'package:flutter_app/views/admin/View_Index.dart' as admin;
// ADMIN TEMPAT
import 'package:flutter_app/views/admin/tempats/View_Index.dart' as admin_tempats;
import 'package:flutter_app/views/admin/tempats/View_Create.dart' as admin_tempats;
import 'package:flutter_app/views/admin/tempats/View_Show.dart' as admin_tempats;

import 'package:flutter_app/tests/ImagePickerTest.dart' as test;
import 'package:flutter_app/tests/Quiz.dart' as test;


final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/"           : (context) => guest.View_Index(),
  // AUTH
  "/checkauth"      : (context) => auth.CheckAuth(),
  "/login"           : (context) => auth.View_login(),
  "/register"           : (context) => auth.View_Register(),

  // ADMIN
  "/admin"           : (context) => admin.View_Index(),
  // ADMIN : TEMPAT
  "/admin/tempats"    : (context) => admin_tempats.View_Index(),
  "/admin/tempats/create"    : (context) => admin_tempats.View_Create(),
  "/admin/tempats/show"    : (context) => admin_tempats.View_Show(),

  // MEMBER : TEMPAT
  "/member/tempats"    : (context) => member_tempats.View_Index(),
  "/member/tempats/show"    : (context) => member_tempats.View_Show(),

  // TESTING
  "/test/imagepick"           : (context) => test.ImagePickerTest(),
  "/test/quiz"           : (context) => test.Quiz(),
};