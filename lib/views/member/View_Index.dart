import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

// component
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';

class View_Index extends StatefulWidget {
  @override
  _View_IndexState createState() => _View_IndexState();
}

class _View_IndexState extends State<View_Index> {
  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return GestureDetector(
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
            body: BodyIndex(),
            bottomNavigationBar: SizedBox(
              height: 85,
              child: BottomNavigationBar(
                selectedItemColor: HexColor(Variable.color('primary')),
                currentIndex: 1, // this will be set when a new tab is tapped
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                        child: Icon(Icons.map),
                        margin: EdgeInsets.only(bottom: 3)),
                    title: Text(
                      'Rincian Nilai \nWilayah',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        child: Icon(Icons.fastfood),
                        margin: EdgeInsets.only(bottom: 3)),
                    title: Text(
                      'Data Nilai \nTempat',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                        child: Icon(Icons.explore),
                        margin: EdgeInsets.only(bottom: 3)),
                    title: Text(
                      'Explore Berita \nSanitasi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ],
              ),
            )));
  }
}

class CardFoodPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/member/show', 
          arguments: "asu"
        );
        print('asdf');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        margin: EdgeInsets.only(bottom: 20.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: HexColor(Variable.color('link'))),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/food_places/1.png'))),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          widthFactor: 1,
          heightFactor: .46,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 12, 8),
              color: HexColor(Variable.color('light')),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 4.0),
                        child: Text('Warung Pak Edi',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: HexColor(Variable.color('dark')),
                              fontSize: 16.0,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: Text('Sumbersari, Jember',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: HexColor(Variable.color('secondary')),
                              fontSize: 10.0,
                            )),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 4),
                              child: Icon(Icons.comment, size: 10)),
                          Text('4 Review',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: HexColor(Variable.color('secondary')),
                                fontSize: 10.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 5),
                          color: HexColor(Variable.color('link')),
                          width: 78,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text('Nilai Sanitasi',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          HexColor(Variable.color('secondary')),
                                      fontSize: 8,
                                    )),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text('4.1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color:
                                          HexColor(Variable.color('success')),
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 2),
                          color: HexColor(Variable.color('link')),
                          width: 78,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Text('Nilai Sanitasi',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color:
                                          HexColor(Variable.color('secondary')),
                                      fontSize: 8,
                                    )),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text('4.1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color:
                                          HexColor(Variable.color('success')),
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

// BodyIndex : Launch first when View_Index init
class BodyIndex extends StatefulWidget {
  @override
  _BodyIndexState createState() => _BodyIndexState();
}

class _BodyIndexState extends State<BodyIndex> {
  FocusNode _currentNode = new FocusNode();


  @override
  Widget build(BuildContext context) {
    return ContainerBase(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderText.Title("Apa Tempat Makanmu sudah sehat ?"),
          HeaderText.Subtitle("Yuk Check Dulu di Watklin"),
          Container(
            margin: EdgeInsets.only(bottom: 40.0),
            child: TextField(
              focusNode: _currentNode,
              decoration: InputDecoration(
                labelText: 'Enter your username',
                suffixIcon: Container(
                    color: HexColor(Variable.color('primary')),
                    padding: EdgeInsets.only(top: 0.0, right: 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Cari',
                          style: TextStyle(
                              color: HexColor(Variable.color('white')),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _currentNode.hasFocus
                        ? HexColor(Variable.color('primary'))
                        : HexColor(Variable.color('secondary')),
                    fontSize: 14.0),
                isDense: true,
                hintText: 'Enter a search term',
                hintStyle: TextStyle(
                    color: HexColor(Variable.color('secondary')),
                    fontSize: 14.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: HexColor(Variable.color('primary'))),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ),
          CardFoodPlace(),
        ],
      ),
    );
  }
}
