import 'package:flutter/material.dart';
import 'package:flutter_app/views/guest/View_Developer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

import 'package:flutter_app/views/guest/View_Splash.dart';

class View_Index extends StatefulWidget {
  @override
  _View_IndexState createState() => _View_IndexState();
}

class _View_IndexState extends State<View_Index> {
  Widget _currentBody;

  @override
  void initState() {
    super.initState();
    _currentBody = View_Splash();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarLayouts(appName: 'CLEAN WATER AND SANITATOIN : 6'),
      endDrawer: Sidebar(
        child: ListView(
          children: [
            Container(
              height: 320.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'images/logo/watklin.svg',
                    placeholderBuilder: (context) => CircularProgressIndicator(),
                    height: 240.0,
                  ),
                  Text(
                    'Watklin',
                    style: TextStyle(
                      color: color('primary'),
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    decoration: BoxDecoration(
                      border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                        color: color('secondary'),
                      )
                    ),
                  )
                  )
                ],
              )
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.of(context).pop();
                            setState(() {
                              _currentBody = View_Developer();
                            });
                          },
                          contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                          leading: Icon(Icons.info_outline,
                            color: color('dark')
                          ),
                          title: Container(
                            transform:
                              Matrix4.translationValues(-15.0, 0.0, 0.0),
                            child: Text(
                              'Developer',
                              style: TextStyle(
                                color: color('dark'),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: _currentBody
    );
  }
}