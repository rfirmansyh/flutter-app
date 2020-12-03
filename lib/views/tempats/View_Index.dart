import 'package:flutter/material.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_components/CardFoodPlace.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

class View_Index extends StatefulWidget {
  @override
  _View_IndexState createState() => _View_IndexState();
}

class _View_IndexState extends State<View_Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
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
            ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: 300
              ),
              child:ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                    return CardFoodPlace();
                }
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavbarBottom(),
    );
  }
}
