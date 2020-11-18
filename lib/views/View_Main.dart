import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

import 'package:flutter_app/views/View_Developer.dart';

// view main pertama dijalankan melalui konteks '/'
class View_Main extends StatefulWidget {
  @override
  _View_MainState createState() => _View_MainState();
}

class _View_MainState extends State<View_Main> {
  Widget _currentContainer;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.7;

    return Scaffold(
        appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
        endDrawer: Sidebar(onIconTap: () {
          setState(() {
            Navigator.pop(context);
            _currentContainer = View_Developer(
              onPress: () {
                setState(() {
                  _currentContainer = View_MainContainer(height: mediaQuery.height);
                });
              },
            );
          });
        }),
        body: _currentContainer = _currentContainer == null
            ? View_MainContainer(height: mediaQuery.height)
            : _currentContainer);
  }
}

class View_MainContainer extends StatelessWidget {
  double height;
  View_MainContainer({Key key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView(children: <Widget>[
        Container(
          padding:
              EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  // margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
                  child: SvgPicture.asset(
                    'images/misc/svg/phone-splash.svg',
                    placeholderBuilder: (context) =>
                        CircularProgressIndicator(),
                    height: 300.0,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 25.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Watklin',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: HexColor(Variable.color('dark')),
                                fontSize: 24.0),
                          ),
                        ),
                        Text(
                          'Antisipasi Lingkungan yang tidak sehat dengan genggaman',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: HexColor(Variable.color('secondary')),
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    )),
                RaisedButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 24, right: 24),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: HexColor(Variable.color('primary')),
                  child: Text(
                    'Mulai Sekarang',
                    style: TextStyle(
                        color: HexColor(Variable.color('white')),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
