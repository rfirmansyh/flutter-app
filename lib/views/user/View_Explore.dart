
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';

// component
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';


class View_Explore extends StatefulWidget {
  @override
  _View_ExploreState createState() => _View_ExploreState();
}

class _View_ExploreState extends State<View_Explore> {
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
          appBar: AppBarLayouts(appName: 'Watklin'),
          body: BodyIndex(),
          bottomNavigationBar: NavbarBottom()
      )
    );
  }}


  //Card berita
  class CardBerita extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: () {
       Navigator.pushNamed(context, '/member/show', 
          arguments: "asa"
        );
        print('asdf');
     },
     child: Container(
       width: MediaQuery.of(context).size.width,
       height: 170,
       margin: EdgeInsets.only(bottom: 20.0),
       clipBehavior: Clip.antiAlias,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(5),
         border: Border.all(color: HexColor(Variable.color('link'))),),
       child: Row(
          children: <Widget>[
            Expanded(
              flex: 6, // 70% of space => (6/(6 + 4))
              child: Container(
              child: Container(
                height: 180,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(11, 18, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column( 
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container (
                          margin: EdgeInsets.only(bottom:6.0),
                          child: Text ('Warung Pak Edi',
                          style: TextStyle (
                            fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: HexColor(Variable.color('dark')),
                              fontSize: 16.0,
                          ),),
                        ),
                        Container (
                          child:Text ('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla cursus metus ut odio eleifend, at tincidunt neque blandit. Phasellus non consequat libero. Maecenas nec dignissim leo...... ',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                              color: HexColor(Variable.color('secondary')),
                              fontSize: 10.0,
                          ),) ,),
                          Container (
                          margin: EdgeInsets.only(top: 18.0),
                          child:Text ('8 Januari 2020',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                              color: HexColor(Variable.color('secondary')),
                              fontSize: 8.0,
                          ),) ,)
                      ],    
                    ),
                  ],),
              ),
              ),),
            Container (
              width: 2,
              height: 100,
              color: Colors.grey,
            ),
            Expanded(
              flex: 3, // 30% of space
              child: Container(
              child: Container(
                height: 180,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(11, 18, 8, 8),
                child: Column (
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      Column (children: <Widget>[
                        ClipRRect(
                           borderRadius: BorderRadius.circular(5),
                           child: Image.asset('images/food_places/1.png'),
                        ),
                        Row (
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[

                          Container (
                            child: new Image.asset('images/share.png', height: 15, width: 15,),
                            margin: EdgeInsets.all(9.0),
                          ),
                          Container (
                            child: new Image.asset('images/view.png', height: 40, width: 20,),
                            margin: EdgeInsets.all(9.0),
                          ),
                        ],)

                      ],),
                       ],)
              ),
              ),),
      ],
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
          HeaderText.Title("Explore"),
          HeaderText.Subtitle("Cari tau informasi sanitasi"),
          Container(
            margin: EdgeInsets.only(bottom: 40.0),
            child: TextField(
              focusNode: _currentNode,
              decoration: InputDecoration(
                labelText: 'Cari berita ...',
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
                hintText: 'Berita yang ingin dicari',
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
          Container(
            height: 525,
            padding: EdgeInsets.only(top: 20, ),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return CardBerita();
                }
            ),
          )
        ],
      ),
    );
  }
}
