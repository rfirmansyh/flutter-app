import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/color.dart';

class AppBarLayouts extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();
  String appName;
  bool is_back_nav;

  AppBarLayouts({
    Key key, 
    @required this.appName,
    this.is_back_nav = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (is_back_nav == false) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Container(
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                child: SvgPicture.asset(
                  'images/logo/watklin.svg',
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                  width: 24.0,
                ),
              ),
              Text(
                appName,
                style: TextStyle(
                  color: color('primary'),
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0),
              ),
            ],
          )
        ),
        actions: <Widget>[
          IconButton(
            color: color('primary'),
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      );
    } else {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: color('primary'), //change your color here
        ),
        title: Container(
          child: Row(
            children: [
              Text(
                appName,
                style: TextStyle(
                  color: color('primary'),
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0),
              ),
            ],
          )
        ),
      );
    }
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
