import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Scaffold(
            appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
            body: ContainerBase(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  HeaderText.Title('Mendaftar'),
                  HeaderText.Subtitle('Buat Akun Baru'),
                  FormControl(
                    labelText: "Nama Lengkap",
                    hintText: "Ex: John Doe",
                  ),
                  FormControl(
                    labelText: "Username",
                    hintText: "Ex: johndoe",
                  ),
                  FormControl(
                    labelText: "Password",
                    hintText: "Fill with the strong password",
                    isPasswordField: true,
                  ),
                  FormControl(
                    labelText: "Verifikasi Password",
                    hintText: "Fill with password above",
                    isPasswordField: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                      Button(
                        margin: EdgeInsets.only(right: 10),
                        type: 'outline',
                        text: 'Register',
                        onPressed: () {},
                        butonColor: color('primary'),
                      ),
                      Button(
                        type: 'solid',
                        text: 'Login',
                        onPressed: ()  {
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