import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

// component
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';

class View_Show extends StatefulWidget {
  @override
  _View_ShowState createState() => _View_ShowState();
}

class _View_ShowState extends State<View_Show> {
  @override
  Widget build(BuildContext context) {
    String text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
      body: BodyShow(),
    );
  }
}

class BodyShow extends StatelessWidget {
  List<Widget> star = new List<Widget>();

  @override
  Widget build(BuildContext context) {
    for (var i = 5; i >= 1; i--) {
      star.add(Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Text(i.toString()),
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Container(
              height: 6,
              color: HexColor(Variable.color('link')),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (i/10),
                heightFactor: 1,
                child: Container(
                  color: HexColor(Variable.color('primary')),
                ),
              ),
            ),
          )
        ],
      ));
    }

    return ContainerBase(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          HeaderText.Title("Rincian Hasil Sanitasi"),
          HeaderText.Subtitle("Detail Rincian Tempat Hasil Sanitasi"),
          Container(
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
          ),
          Row(
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
                ],
              ),
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
                              color: HexColor(Variable.color('secondary')),
                              fontSize: 8,
                            )),
                      ),
                      Expanded(
                        flex: 0,
                        child: Text('4.1',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: HexColor(Variable.color('success')),
                              fontSize: 14,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: HexColor(Variable.color('secondary-500')))),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 4.0),
                      child: Text('Review dan Komentar',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: HexColor(Variable.color('dark')),
                            fontSize: 12.0,
                          )),
                    ),
                    Container(
                      child: Text('Nilai dari mereka yang sudah berkunjung',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: HexColor(Variable.color('secondary')),
                            fontSize: 8.0,
                          )),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    // Navigator.pushNamed(context, '/show');
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.only(
                      top: 8, bottom: 8, left: 16, right: 16),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: HexColor(Variable.color('primary')),
                  child: Text(
                    'Buat Review',
                    style: TextStyle(
                        color: HexColor(Variable.color('white')),
                        fontWeight: FontWeight.w700,
                        fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  margin: EdgeInsets.only(right: 20),
                  width: 82,
                  height: 82,
                  color: HexColor(Variable.color('link')),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Text(
                          '4.1',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: HexColor(Variable.color('success')),
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Text(
                        '5',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: HexColor(Variable.color('secondary')),
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(children: star),
              )
            ],
          )
        ]));
  }
}

// $jsonfile;
// $jsonfile_index;
// foreach ($data as $i => $d) {
//     if ($d['id'] == $id) {
//         $jsonfile = $d;
//         $jsonfile_index = $i;
//     }
// }

// $data_update = [
//   'id' => $request->id,
//   'title' => $request->title,
//   'author' => $request->author,
//   'content' => $request->content,
//   'create_at' => Carbon:blalbal
// ];

// $data[jsonfile_index] = $data_update;
// $data = json_encode($data, JSON_PRETTY_PRINT);
