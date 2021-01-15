import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/_models/AveragePlace.dart';
import 'package:flutter_app/_models/Kabupaten.dart';
import 'package:flutter_app/_models/Tempat.dart';
import 'package:flutter_app/_models/User.dart';
import 'package:flutter_app/api.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loadmore/loadmore.dart';
import 'package:incrementally_loading_listview/incrementally_loading_listview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_app/views/auth/CheckAuth.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_components/CardFoodPlace.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

class View_Average extends StatefulWidget {
    @override
    _View_AverageState createState() => _View_AverageState();
}

class _View_AverageState extends State<View_Average> {
    User user;
    List<Kabupaten> kabupatens;
    Kabupaten selectedKabupaten;
    AveragePlace averagePlace = null;

    @override
    void initState() {
        super.initState();
        getKabupaten();
        getLocalStorage();
    }

    void getKabupaten() async {
        var res = await Network().getData('/kabupatens');
        var body = jsonDecode(res.body);
        // print(body);
        List<Kabupaten> tempListKabupaten = body['data'].map<Kabupaten>((item) => Kabupaten.fromJson(item)).toList();
        setState(() {
            kabupatens = tempListKabupaten;
        });
    }

    void getLocalStorage() async {
        SharedPreferences localStroge = await SharedPreferences.getInstance();
        setState(() {
            user = User.fromJson(json.decode(localStroge.get('user')));
        });
    }

    void getAveragePlace({int kabupaten_id}) async {
        var res = await Network().getData('/tempats/ratebyplace/$kabupaten_id');
        var body = jsonDecode(res.body);
        if (body['data'] != null) {
            setState(() {
                averagePlace = AveragePlace.fromJson(body['data']);
            });
        } 
    }

    void logout() async {
        SharedPreferences localStroge = await SharedPreferences.getInstance();
        var res = await Network().authPostData(null, '/logout');
        var body = await json.decode(res.body);
        localStroge.remove('token');
    }
    @override
    Widget build(BuildContext context) {
        return SafeArea(
            child: Scaffold(
                appBar: AppBarLayouts(
                    appName: 'Watklin', is_back_nav: false,
                ),
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

                        // PROFIL OR LOGIN
                        Container(
                            child: Column(
                            children: [
                                Container(
                                width: double.infinity,
                                // child: ListTileCheck
                                child: Column(
                                    children: [
                                    // IF LOGGED IN -> PROFILE, ELSE -> LOGIN
                                    ListTile(
                                        onTap: () {
                                        logout();
                                        Navigator.pushNamed(context, '/checkauth');
                                        },
                                        contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                        leading: Icon(
                                        Icons.login,
                                        color: color('danger')
                                        ),
                                        title: Container(
                                        transform:
                                            Matrix4.translationValues(-15.0, 0.0, 0.0),
                                        child: Text(
                                            'Logout',
                                            style: TextStyle(
                                            color: color('danger'),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            ),
                                        ),
                                        ),
                                    ),
                                    ListTile(
                                        onTap: () {},
                                        contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                                        leading: Icon(
                                        Icons.info,
                                        color: color('dark')
                                        ),
                                        title: Container(
                                        transform:
                                            Matrix4.translationValues(-15.0, 0.0, 0.0),
                                        child: Text(
                                            'About',
                                            style: TextStyle(
                                            color: color('dark'),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w700,
                                            ),
                                        ),
                                        ),
                                    )
                                    ],
                                ),
                                ),
                            ],
                            ),
                        )
                        ],
                    ),
                ),
                body: ContainerBase(
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: 400
                        ),
                        child: Column(
                            children: <Widget> [
                                averagePlace != null ? 
                                HeaderText.Title('Hasil Pencarian', textcolor: color('primary')) : Text(''),
                                Container(
                                    margin: EdgeInsets.only(bottom: 30, top: 20),
                                    width: 135,
                                    height: 135,
                                    clipBehavior: Clip.none,
                                    decoration: BoxDecoration(
                                        color: color('light'),
                                        shape: BoxShape.circle
                                    ),
                                    child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                            Positioned(
                                                bottom: -25,
                                                right: -25,
                                                child: Opacity(
                                                    opacity: .2,
                                                    child: Icon(
                                                        Icons.map,
                                                        size: 130,
                                                        color: color('secondary'),
                                                    ),
                                                ),
                                            ),
                                            Icon(
                                                Icons.map,
                                                size: 130,
                                                color: color('secondary'),
                                            )
                                        ],
                                        ),
                                ),
                                averagePlace != null ? 
                                    HeaderText.Title(averagePlace.name, textcolor: color('primary')):
                                    HeaderText.Title('Lihat Rata-rata nilai sanitasi Wilayah'),
                                averagePlace != null ? 
                                    HeaderText.Subtitle('Hasil Nilai Rata rata', margin: EdgeInsets.only(bottom: 30)):
                                    HeaderText.Subtitle('Yuk, cari tau dulu di watklin', margin: EdgeInsets.only(bottom: 30)),
                                Container(
                                    height: 50,
                                    margin: EdgeInsets.only(bottom: 30),
                                    child: DropdownSearch<Kabupaten>(
                                        items: kabupatens,
                                        label: 'Pilih Kabupaten',
                                        popupTitle: Container(
                                        padding: EdgeInsets.all(30),
                                        color: color('primary'),
                                        child: Text(
                                            'Pilih Provinsi',
                                            style: TextStyle(color: color('white')),
                                        ),
                                        ),
                                        showSearchBox: true,
                                        onFind: (String filter) {},
                                        onChanged: (Kabupaten data) {
                                            getAveragePlace(kabupaten_id: data.id);
                                        },
                                        maxHeight: 420,
                                    ),
                                ),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: color('link')
                                            ),
                                            child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minHeight: 80,
                                                minWidth: 80
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                Container(
                                                    margin: EdgeInsets.only(bottom: 10),
                                                    child: Text(
                                                        averagePlace != null ? '${averagePlace.averageRating}' : '0',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                        color: averagePlace == null ? color('secondary') : color('success'),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 28
                                                        ),
                                                    ),
                                                ),
                                                Text(
                                                    'Rata - rata \nnilai Sanitasi',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                    color: color('dark'),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10
                                                    ),
                                                ),
                                                ],
                                            ),
                                            ),
                                        ),
                                        SizedBox(
                                            width: 20,
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: color('link')
                                            ),
                                            child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                                minHeight: 80,
                                                minWidth: 80
                                            ),
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                Container(
                                                    margin: EdgeInsets.only(bottom: 10),
                                                    child:  Text(
                                                        averagePlace != null ? '${averagePlace.averageReview}' : '0',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                        color: averagePlace == null ? color('secondary') : color('primary'),
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 28
                                                        ),
                                                    ),
                                                ),
                                                Text(
                                                    'Rata - rata \nnilai Review',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                    color: color('dark'),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10
                                                    ),
                                                ),
                                                ],
                                            ),
                                            ),
                                        ),
                                    ],
                                )
                            ],
                        ),
                    ),
                ),
                bottomNavigationBar: NavbarBottom(
                    active: 'average',
                ),
            ),
        );
    }
}