import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

// class sidebar/drawer yang dipisah agar lebih mudah di manage
class Sidebar extends StatelessWidget {
  Function onIconTap;
  Sidebar({Key key, @required this.onIconTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.7;

    return Container(
      width: sidebarSize,
      height: mediaQuery.height,
      child: Drawer(
        child: Container(
          padding:
              EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0, bottom: 24.0),
          child: ListView(
            children: [
              Container(
                  height: 320.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'images/logo/watklin.svg',
                        placeholderBuilder: (context) =>
                            CircularProgressIndicator(),
                        height: 240.0,
                      ),
                      Text(
                        'Watklin',
                        style: TextStyle(
                            color: HexColor(Variable.color('primary')),
                            fontSize: 32.0,
                            fontWeight: FontWeight.w800),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20.0),
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              width: 0.5,
                              color: HexColor(Variable.color('secondary'))),
                        )),
                      )
                    ],
                  )),
              Container(
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              contentPadding:
                                  EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                              leading: Icon(Icons.info_outline,
                                  color: HexColor(Variable.color('dark'))),
                              title: Container(
                                transform:
                                    Matrix4.translationValues(-15.0, 0.0, 0.0),
                                child: Text(
                                  'Developer',
                                  style: TextStyle(
                                    color: HexColor(Variable.color('dark')),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              onTap: onIconTap,
                            ),
                          ],
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
