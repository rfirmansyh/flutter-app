import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/_components/Button.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/FormControl.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/_base/color.dart';

class View_Register extends StatefulWidget {
  @override
  _View_RegisterState createState() => _View_RegisterState();
}

class _View_RegisterState extends State<View_Register> {
  final _formKey = GlobalKey<FormState>();
  var name;
  var email;
  var password;


  void register() async {
    var data = {
      'name' : name,
      'email' : email,
      'password' : password
    };

    var res = await Network().postData(data, '/register');
    var body = json.decode(res.body);
    print(body);
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Scaffold(
            appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
            body: ContainerBase(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    HeaderText.Title('Mendaftar'),
                    HeaderText.Subtitle('Buat Akun Baru', margin: EdgeInsets.only(bottom: 20)),
                    FormControl(
                      labelText: "Nama Lengkap",
                      hintText: "Ex: John Doe",
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter email';
                        }
                        name = value;
                        return null;
                      },
                    ),
                    FormControl(
                      labelText: "Email",
                      hintText: "Input Your Email here...",
                      validator: (emailValue) {
                        if (emailValue.isEmpty) {
                          return 'Please enter email';
                        }
                        email = emailValue;
                        return null;
                      },
                    ),
                    FormControl(
                      labelText: "Password",
                      hintText: "Input Your Password here...",
                      validator: (passwordValue) {
                        if (passwordValue.isEmpty) {
                          return 'Please enter some text';
                        } else if (passwordValue.length  < 6) {
                          return 'Password minimal 6 Karakter';
                        }
                        password = passwordValue;
                        return null;
                      },
                      isPasswordField: true,
                    ),
                    FormControl(
                      labelText: "Verifikasi Password",
                      hintText: "Fill with password above",
                      isPasswordField: true,
                      validator: (passwordValue) {
                        if (passwordValue != password) {
                          return 'Password Tidak Cocok';
                        }
                        return null;
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget> [
                        Button(
                          margin: EdgeInsets.only(right: 10),
                          type: 'outline',
                          text: 'Login',
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          butonColor: color('primary'),
                        ),
                        Button(
                          type: 'solid',
                          text: 'Register',
                          onPressed: ()  {
                            if (_formKey.currentState.validate()) {
                              register();
                            }
                            // SharedPreferences localStorage = await SharedPreferences.getInstance();
                            // print(localStorage.getString('token'));
                            // Navigator.pushNamed(context, '/login');
                          },
                          butonColor: color('primary'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ),
          Positioned(
            right: -80,
            top: -80,
            child: Opacity(
              opacity: .1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(240),
                child: Container(
                  width: 240,
                  height: 240,
                  color: color('primary'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}