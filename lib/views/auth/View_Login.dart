import 'package:flutter/material.dart';
import 'package:flutter_app/_components/Button.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/FormControl.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_app/_base/color.dart';

class View_login extends StatefulWidget {
  @override
  _View_loginState createState() => _View_loginState();
}

class _View_loginState extends State<View_login> {
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
                  HeaderText.Title('Selamat Datang Kembali'),
                  HeaderText.Subtitle('Lorem Ipsum Dolor sit amet amet'),
                  FormControl(
                    labelText: "Username",
                    hintText: "Input Your username here...",
                  ),
                  FormControl(
                    labelText: "Password",
                    hintText: "Input Your username here...",
                    isPasswordField: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                      Button(
                        margin: EdgeInsets.only(right: 10),
                        type: 'outline',
                        text: 'Register',
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        butonColor: color('primary'),
                      ),
                      Button(
                        type: 'solid',
                        text: 'Login',
                        onPressed: () {},
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
