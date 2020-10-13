import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/pages/app/Developer.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  Widget _currentContainer;

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    double sidebarSize = mediaQuery.width * 0.7;

    return Scaffold(
        appBar: AppBarLayouts(appName: 'asdf'),
        endDrawer: Container(
          width: sidebarSize,
          height: mediaQuery.height,
          child: Drawer(
            child: Container(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 24.0, bottom: 24.0),
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
                                      color:
                                          HexColor(Variable.color('dark'))),
                                  title: Container(
                                    transform: Matrix4.translationValues(
                                        -15.0, 0.0, 0.0),
                                    child: Text(
                                      'Developer',
                                      style: TextStyle(
                                        color:
                                            HexColor(Variable.color('dark')),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      Navigator.pop(context);
                                      _currentContainer = Developer(
                                        onPress: () {
                                          setState(() {
                                            _currentContainer = MainContainer(
                                                height: mediaQuery.height);
                                          });
                                        },
                                      );
                                    });
                                  },
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
        ),
        body: _currentContainer = _currentContainer == null
            ? MainContainer(height: mediaQuery.height)
            : _currentContainer);
  }
}

class MainContainer extends StatelessWidget {
  double height;
  MainContainer({Key key, @required this.height}) : super(key: key);

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
