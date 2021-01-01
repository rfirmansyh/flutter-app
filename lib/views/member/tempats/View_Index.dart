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
    return SafeArea(
      child: Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              HeaderText.Title("Apa Tempat Makanmu sudah sehat ?"),
              HeaderText.Subtitle("Yuk Check Dulu di Watklin"),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    suffixIcon: Container(
                      color:color('primary'),
                      padding: EdgeInsets.only(top: 0.0, right: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cari',
                            style: TextStyle(
                                color: color('white'),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: color('secondary'),
                      fontSize: 14.0
                    ),
                    isDense: true,
                    hintText: 'Enter a search term',
                    hintStyle: TextStyle(
                      color: color('secondary'),
                      fontSize: 14.0
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:color('primary')),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavbarBottom(),
      ),
    );
  }
}

class ListTileCheck extends StatelessWidget {
  const ListTileCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IF LOGGED IN -> PROFILE, ELSE -> LOGIN
        FutureBuilder<bool>(
          future: CheckAuth.user(),
          builder: (context, snapshot) {
            return ListTile(
              onTap: () {
                print(snapshot.data);
              },
              contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              leading: Icon(
                snapshot.data == true ? Icons.account_circle : Icons.login,
                color: color('dark')
              ),
              title: Container(
                transform:
                  Matrix4.translationValues(-15.0, 0.0, 0.0),
                child: Text(
                  snapshot.data == true ? 'Profil' : 'Login',
                  style: TextStyle(
                    color: color('dark'),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            );
          },
        ),
        // IF LOGGED IN -> LOGOUT, ELSE -> NULL
        FutureBuilder<bool>(
          future: CheckAuth.user(),
          builder: (context, snapshot) {
            if (snapshot.data == true) {
              return ListTile(
                onTap: () async {
                  var res = await Network().postData(null, '/logout');
                  print(res);
                  SharedPreferences localStorage = await SharedPreferences.getInstance();
                  localStorage.remove('token');
                  localStorage.remove('user');
                  Navigator.pushNamed(context, '/checkauth');
                },
                contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                leading: Icon(
                  Icons.logout,
                  color: color('dark')
                ),
                title: Container(
                  transform:
                    Matrix4.translationValues(-15.0, 0.0, 0.0),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: color('dark'),
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            } else {
              return Text('');
            }
            
          },
        ),
      ],
    );
  }
}
