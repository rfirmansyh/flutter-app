import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';

// component
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_components/FormControl.dart';

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
        bottomNavigationBar: NavbarBottom());
  }
}

class BodyShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> star = new List<Widget>();
    for (var i = 5; i >= 1; i--) {
      star.add(Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            child: Text(
              i.toString(),
              style: TextStyle(
                  fontSize: 10,
                  color: HexColor(Variable.color('dark')),
                  fontWeight: FontWeight.bold),
            ),
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
            child: Container(
              height: 6,
              color: HexColor(Variable.color('link')),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (i / 10),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText.Title("Rincian Hasil Sanitasi"),
                  HeaderText.Subtitle("Detail Rincian Tempat Hasil Sanitasi"),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          color: HexColor(Variable.color('link')),
                          child: Icon(Icons.keyboard_arrow_left,
                              color: HexColor(Variable.color('secondary'))),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          // GAMBAR TEMPAT
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
          // NAMA TEMPAT
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
          // DIVIDER
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Divider(color: HexColor(Variable.color('secondary-500')))),
          // BUAT REVIEW
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
                            fontSize: 14.0,
                          )),
                    ),
                    Container(
                      width: 180,
                      child: Text('Nilai dari mereka yang sudah berkunjung',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: HexColor(Variable.color('secondary')),
                            fontSize: 10.0,
                          )),
                    ),
                  ],
                ),
                RaisedButton(
                  onPressed: () {
                    Modal.Show(
                      context, 
                      confirmText: 'Kirim Review', 
                      height: MediaQuery.of(context).size.height - 180);
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
          // HASIL REVIEW
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
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
            ),
          ),
          // RATING AND COMMENT
          CardComment(),
        ]));
  }
}

class CardComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  margin: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border:
                          Border.all(color: HexColor(Variable.color('link'))),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/food_places/1.png'))),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 4.0),
                        child: Text('Rahmad Firmansyah',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: HexColor(Variable.color('dark')),
                              fontSize: 14.0,
                            )),
                      ),
                      Container(
                        width: 180,
                        child: Text('2, 10 2020',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: HexColor(Variable.color('secondary')),
                              fontSize: 10.0,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: SmoothStarRating(
              allowHalfRating: false,
              isReadOnly: true,
              starCount: 5,
              rating: 3,
              size: 20.0,
              filledIconData: Icons.star,
              halfFilledIconData: Icons.star,
              color: HexColor(Variable.color('primary')),
              borderColor: HexColor(Variable.color('primary')),
              spacing: 0.0),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Enim mollis dui, ut semper nibh sed at tempus nibh. Fringilla et faucibus morbi vitae ullamcorper. Ultrices purus habitant sit elit sit dignissim feugiat ultricies ullamcorper. Facilisi quam tortor sed viverra ultrices enim.',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: HexColor(Variable.color('secondary'))),
            ),
          ),
          Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Divider(color: HexColor(Variable.color('secondary-500')))),
        ],
      ),
    );
  }
}

class Modal {

  static void Show(BuildContext context, {
      Widget child, 
      String confirmText,
      double height
    }) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: height == null ? MediaQuery.of(context).size.height - 120 : height,
                padding: EdgeInsets.all(25),
                color: HexColor(Variable.color('white')),
                child: Material(
                  color: Colors.white,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget> [
                                HeaderText.Title('Buat Review'),
                                HeaderText.Subtitle('Buat Review Tempat Terkait'),
                              ],
                            ),
                            Container(
                              width: 50,
                              child: RaisedButton(
                                color: Colors.white,
                                focusColor: Colors.white,
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                elevation: 0,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.close,
                                  color: HexColor(Variable.color('secondary')),
                                ),
                              ),
                            )
                          ],
                        ),
                        HeaderText.Title("Jumlah Rating", margin: EdgeInsets.only(bottom: 16)),
                        SmoothStarRating(
                          allowHalfRating: false,
                          starCount: 5,
                          rating: 3,
                          size: 40.0,
                          filledIconData: Icons.star,
                          halfFilledIconData: Icons.star,
                          color: HexColor(Variable.color('primary')),
                          borderColor: HexColor(Variable.color('primary')),
                          spacing: 0.0),
                        // DIVIDER
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Divider(color: HexColor(Variable.color('secondary-500')))),
                        FormControl.TextArea(
                          label: 'Masukan Komentar',
                          hintText: 'Masukan Komentarmu Disini...'
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              RaisedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/member/show');
                                },
                                textColor: Colors.white,
                                padding: const EdgeInsets.only(
                                    top: 12, bottom: 12, left: 24, right: 24),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                color: HexColor(Variable.color('primary')),
                                child: Text(
                                  confirmText == null ? 'Confirm' : confirmText,
                                  style: TextStyle(
                                      color: HexColor(Variable.color('white')),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ),
            ),
          );
        });
  }
}