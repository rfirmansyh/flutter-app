import 'package:flutter/material.dart';
import 'package:loadmore/loadmore.dart';

class ContainerBase extends StatelessWidget {
  Widget child;
  bool onNotification;

  ContainerBase({Key key, @required this.child, this.onNotification = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;

    if (onNotification) {
      return Container(
        height: mediaQuery.height,
        child: this.child
      );
    } 
    return Container(
      height: mediaQuery.height,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: this.child,
          )
        ],
      ),
    );
  }
}