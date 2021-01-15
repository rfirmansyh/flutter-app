import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/color.dart';

class NavbarBottom extends StatefulWidget {
  String active;

  NavbarBottom({
    Key key,
    this.active = 'tempats'
  }) : super(key: key);
  @override
  _NavbarBottomState createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 84,
        padding: EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                Navigator.pushNamed(context, '/member/tempats');
              },
              child: Column(
                children: <Widget>[
                  Container(
                      child: Icon(
                        Icons.fastfood,
                        color: widget.active == 'tempats' ? color('primary') : color('dark'),
                      ),
                      margin: EdgeInsets.only(bottom: 3)),
                  Text(
                    'Data Nilai \nTempat',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      color: widget.active == 'tempats' ? color('primary') : color('dark')
                    ),
                  ),
                ],
              ),
            ),
            Container (
              width: 1,
              height: 50,
              color: color('link'),
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {
                Navigator.pushNamed(context, '/member/tempats/average');
              },
              child: Column(
                children: <Widget>[
                  Container(
                      child: Icon(
                        Icons.map,
                        color: widget.active == 'average' ? color('primary') : color('dark'),
                      ),
                      margin: EdgeInsets.only(bottom: 3)),
                  Text(
                    'Rincian Nilai \nWilayah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 9,
                      color: widget.active == 'average' ? color('primary') : color('dark')
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
