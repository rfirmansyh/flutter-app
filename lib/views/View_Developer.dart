import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_models/Developer.dart';
import 'package:flutter_app/_base/Variable.dart';

class View_Developer extends StatelessWidget {
  Function onPress;

  View_Developer({Key key, @required this.onPress}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    List<Developer> dev = DeveloperList().list;
    Size mediaQuery = MediaQuery.of(context).size;

    return Container(
        height: mediaQuery.height,
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: 24.0, right: 24.0, top: 24.0, bottom: 24.0),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Watklin Developer', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: HexColor(Variable.color('dark')))
                        ),
                        Text('Watklin Developer', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: HexColor(Variable.color('secondary')))
                        ),
                      ]
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0, bottom: 20.0),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color: HexColor(Variable.color('secondary'))),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 35),
                    height: 320,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                      children: List.generate(dev.length, (index) {
                        return Card(
                          elevation: 0,
                          margin: EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 5.0),
                                child: Image.asset(
                                  dev[index].getImageurl,
                                  height: 72.0,
                                ),
                              ),
                              Text(dev[index].getName, textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: HexColor(Variable.color('dark'))
                                ),
                              ),
                              Text(dev[index].getNim, textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: HexColor(Variable.color('secondary')),
                                  fontSize: 12.0
                                ),
                              ),
                            ],
                          ),
                        );
                      })
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: OutlineButton(
                      onPressed: onPress,
                      borderSide: BorderSide(color: HexColor(Variable.color('primary'))),
                      textColor: HexColor(Variable.color('primary')),
                      padding: const EdgeInsets.only(
                          top: 12, bottom: 12, left: 24, right: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      color: HexColor(Variable.color('primary')),
                      child: Text(
                        'Kembali',
                        style: TextStyle(
                            color: HexColor(Variable.color('primary')),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
