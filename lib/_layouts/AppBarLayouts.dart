import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/Variable.dart';

class AppBarLayouts extends StatelessWidget implements PreferredSizeWidget {
  String appName;
  final AppBar appBar = AppBar();

  AppBarLayouts({Key key, @required this.appName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        child: Row(
          children: [
            SvgPicture.asset(
              'images/logo/watklin.svg',
              placeholderBuilder: (context) => CircularProgressIndicator(),
              width: 24.0,
            ),
            Text(
              appName,
              style: TextStyle(
                  color: HexColor(Variable.color('primary')),
                  fontWeight: FontWeight.w800),
            ),
          ],
        )
      ),
      actions: <Widget>[
        IconButton(
          color: HexColor(Variable.color('primary')),
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
