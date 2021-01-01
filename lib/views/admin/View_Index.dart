import 'package:flutter/material.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/views/auth/CheckAuth.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
      endDrawer: Sidebar(
        child: ListView(
          children: [
            Container(
              height: 320.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'images/logo/watklin.svg',
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 240.0,
                  ),
                  Text(
                    'Watklin',
                    style: TextStyle(
                      color: color('primary'),
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: color('secondary'),
                      )
                    ),
                  )
                  )
                ],
              )
            ),

            // PROFIL OR LOGIN
            Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    // child: ListTileCheck
                    child: Column(
                      children: [
                        // IF LOGGED IN -> PROFILE, ELSE -> LOGIN
                        ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          leading: Icon(
                            Icons.login,
                            color: color('dark')
                          ),
                          title: Container(
                            transform:
                              Matrix4.translationValues(-15.0, 0.0, 0.0),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: color('dark'),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          leading: Icon(
                            Icons.info,
                            color: color('dark')
                          ),
                          title: Container(
                            transform:
                              Matrix4.translationValues(-15.0, 0.0, 0.0),
                            child: Text(
                              'About',
                              style: TextStyle(
                                color: color('dark'),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: ContainerBase(
        child: Container(
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
                      image: AssetImage('images/users/1.png')
                    ),
                    color: Colors.red,
                    shape: BoxShape.circle
                  )
                ),
              ),
              HeaderText.Title('Selamat datang Kembali, Admin !'),
              HeaderText.Subtitle('Mulai Harimu sekarang', margin: EdgeInsets.only(bottom: 40)),
              HeaderText.Title('Olah apa hari ini ?', margin: EdgeInsets.only(bottom: 20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
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
                              Icons.supervised_user_circle,
                              color: color('primary'),
                              size: 35,
                            ),
                          ),
                          Text(
                            'Data Pengguna',
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
                  Container(
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
                  Container(
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
                              Icons.explore,
                              color: color('primary'),
                              size: 35,
                            ),
                          ),
                          Text(
                            'Data Berita',
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
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}