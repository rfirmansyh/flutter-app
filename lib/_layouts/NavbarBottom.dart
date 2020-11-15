import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

class NavbarBottom extends StatefulWidget {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Container(
                      child: Icon(Icons.map),
                      margin: EdgeInsets.only(bottom: 3)),
                  Text(
                    'Rincian Nilai \nWilayah',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
            Container (
              width: 1,
              height: 50,
              color: HexColor(Variable.color('link')),
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Container(
                      child: Icon(Icons.fastfood),
                      margin: EdgeInsets.only(bottom: 3)),
                  Text(
                    'Data Nilai \nTempat',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),
            Container (
              width: 1,
              height: 50,
              color: HexColor(Variable.color('link')),
            ),
            FlatButton(
              padding: EdgeInsets.all(10.0),
              onPressed: () {},
              child: Column(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.explore),
                    margin: EdgeInsets.only(bottom: 3)),
                  Text(
                    'Explore Berita \nSanitasi',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 9),
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
