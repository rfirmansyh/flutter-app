import 'package:flutter/material.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_app/_base/color.dart';

class View_Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerBase(
        child: Column(
          children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0, bottom: 20.0),
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
                                  color: color('dark'),
                                  fontSize: 24.0),
                            ),
                          ),
                          Text(
                            'Antisipasi Lingkungan yang tidak sehat dengan genggaman',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: color('secondary'),
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      )),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/member');
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.only(
                        top: 12, bottom: 12, left: 24, right: 24),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    color: color('primary'),
                    child: Text(
                      'Mulai Sekarang',
                      style: TextStyle(
                          color: color('white'),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
        ),
      ),
    );
  }
}