import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/_models/User.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/views/auth/CheckAuth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_components/CardFoodPlace.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';
import 'package:shared_preferences/shared_preferences.dart';


class View_Index extends StatefulWidget {
  @override
  _View_IndexState createState() => _View_IndexState();
}

class _View_IndexState extends State<View_Index> {

    User user;

    @override
    void initState() {
        super.initState();
        getLocalStorage();
    }

    void getLocalStorage() async {
        SharedPreferences localStroge = await SharedPreferences.getInstance();
        setState(() {
            user = User.fromJson(json.decode(localStroge.get('user')));
        });
    }

    void logout() async {
        SharedPreferences localStroge = await SharedPreferences.getInstance();
        var res = await Network().authPostData(null, '/logout');
        var body = await json.decode(res.body);
        localStroge.remove('token');
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6', add_menu: false,),
      body: ContainerBase(
        child: user != null ? Container(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container (
                  margin: EdgeInsets.only(bottom: 30),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: user.photo != null && user.photo != '' ? NetworkImage(user.photo) : AssetImage('images/users/default-user.png')
                    ),
                    color: Colors.red,
                    shape: BoxShape.circle
                  )
                ),
              ),
              HeaderText.Title('Selamat datang Kembali, ${user.name} !', textAlign: TextAlign.center),
              HeaderText.Subtitle('Mulai Harimu sekarang', margin: EdgeInsets.only(bottom: 40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    GestureDetector(
                        onTap: () {
                            Navigator.pushNamed(context, '/admin/tempats');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: color('link')
                            ),
                            child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 80,
                                minWidth: 80
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                    Icons.fastfood,
                                    color: color('primary'),
                                    size: 35,
                                    ),
                                ),
                                Text(
                                    'Data Tempat',
                                    style: TextStyle(
                                    color: color('dark'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                    ),
                                ),
                                ],
                            ),
                            ),
                        ),
                    ),
                    GestureDetector(
                        onTap: () {
                            logout();
                            Navigator.pushNamed(context, '/checkauth');
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: color('link')
                            ),
                            child: ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: 80,
                                minWidth: 80
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Icon(
                                    Icons.login,
                                    color: color('primary'),
                                    size: 35,
                                    ),
                                ),
                                Text(
                                    'Logout',
                                    style: TextStyle(
                                    color: color('dark'),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10
                                    ),
                                ),
                                ],
                            ),
                            ),
                        ),
                    ),
                ],
              )
            ]
          ),
        ) : Text('Waiting Data'),
      ),
    );
  }
}