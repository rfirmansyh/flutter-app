import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/api.dart';

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
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  
  var email;
  var password;

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      )
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        overflow: Overflow.clip,
        children: [
          Scaffold(
            key: _scaffoldKey,
            appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
            body: ContainerBase(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    HeaderText.Title('Selamat Datang Kembali'),
                    HeaderText.Subtitle('Lorem Ipsum Dolor sit amet amet', margin: EdgeInsets.only(bottom: 20)),
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
                        }
                        password = passwordValue;
                        return null;
                      },
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
                          text:  _isLoading == true ? 'Proccessing...' : 'Login',
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _login();
                            }
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

  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email' : email,
      'password' : password
    };

    var res = await Network().authData(data, '/login');
    var body = json.decode(res.body);
    print(body);
    if(body['data'] != null){
      print(body['data']['name']);
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['data']['api_token']));
      localStorage.setString('user', json.encode(body['data']));
      Navigator.pushNamed(context, '/checkauth');
    }else{
      print(body['status']);
    }

    setState(() {
      _isLoading = false;
    });

  }
}
