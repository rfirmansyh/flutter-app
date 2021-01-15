import 'package:flutter/material.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_models/Developer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/_base/color.dart';

class View_Developer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Developer> dev = DeveloperList().list;

    return Scaffold(
      body: ContainerBase(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 320
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Watklin Developer', 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: color('dark'))
                    ),
                    Text('Watklin Developer', 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: color('secondary'))
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
                      color: color('secondary')),
                )),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 200
                  ),
                  child: GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                                color: color('dark')
                              ),
                            ),
                            Text(dev[index].getNim, textAlign: TextAlign.center,
                              style: TextStyle(
                                color: color('secondary'),
                                fontSize: 12.0
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: OutlineButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  borderSide: BorderSide(color: color('primary')),
                  textColor: color('primary'),
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 12, left: 24, right: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  color: color('primary'),
                  child: Text(
                    'Kembali',
                    style: TextStyle(
                        color: color('primary'),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}