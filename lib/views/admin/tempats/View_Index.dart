import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/_models/Tempat.dart';
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


class View_Index extends StatefulWidget {
  View_Index({Key key}) : super(key: key);
  @override
  _View_IndexState createState() => _View_IndexState();
}

class _View_IndexState extends State<View_Index> {
  
  final scrollMain = new ScrollController();
  List<Tempat> tempats;
  bool _isLoad = true;
  bool _hasMoreItems;
  bool _launchLoad = false;
  int _lastPage = 1;
  int _currentPage = 1;
  Future _initialLoad;

  Future _loadFirst() async {
    print("Load All");
    setState(() {
      _isLoad = true;
    });
    // init tempat
    var res = await Network().getData('/tempats');
    var body = jsonDecode(res.body);
    List<Tempat> list2 = body['data'].map<Tempat>((item) => Tempat.fromJson(item)).toList();
    
    await setState(() {
      tempats = list2;
      _lastPage = body['meta']['last_page'];
      _isLoad = false;
      _hasMoreItems = true;
    });
    EasyLoading.dismiss();
    print("Last Page ${_lastPage}");
  }

  @override
  void initState() {
    super.initState();
    EasyLoading.show(status: 'loading...');
    _initialLoad = Future.delayed(Duration(seconds: 10), () {
      _loadFirst();
    });
  }

  Future _loadData() async {
    print("onLoadMore");
    // init tempat
    var res = await Network().getData('/tempats?page=$_currentPage');
    var body = jsonDecode(res.body);
    List<Tempat> list2 = body['data'].map<Tempat>((item) => Tempat.fromJson(item)).toList();

    // After 1 second, it takes you to the bottom of the ListView
    tempats.addAll(list2);
    
    // setState(() {
    //   tempats.addAll(list2);
    //   _currentPage++;
    //   _isLoad = false;
    // });
  }

  Future<void> _refreshData() async {
    print("onRefresh");
    await Future.delayed(Duration(seconds: 0, milliseconds: 2000));
    tempats.clear();
    _loadFirst();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarLayouts(appName: 'Back', is_back_nav: true),
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
                            onTap: () {},
                            contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                            leading: Icon(
                              Icons.login,
                              color: color('dark')
                            ),
                            title: Container(
                              transform:
                                Matrix4.translationValues(-15.0, 0.0, 0.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: color('dark'),
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
          onNotification: true,
          child:  RefreshIndicator(
            onRefresh: _refreshData,
              child: NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (!_isLoad && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                    if (_currentPage < _lastPage) {
                      setState(() {
                        _launchLoad = true;
                      });
                    }
                  } 
                },
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget> [
                          HeaderText.Title("Data Tempat"),
                          HeaderText.Subtitle(
                            "Data Tempat Watklin",
                            margin: EdgeInsets.only(bottom: 30)
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter your username',
                                suffixIcon: Container(
                                  color:color('primary'),
                                  padding: EdgeInsets.only(top: 0.0, right: 0.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Cari',
                                        style: TextStyle(
                                            color: color('white'),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ),
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: color('secondary'),
                                  fontSize: 14.0
                                ),
                                isDense: true,
                                hintText: 'Enter a search term',
                                hintStyle: TextStyle(
                                  color: color('secondary'),
                                  fontSize: 14.0
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:color('primary')),
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              ),
                            ),
                          ),
                          tempats == null ? Text('') : FutureBuilder(
                            future: _initialLoad,
                            builder: (context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return Center(child: CircularProgressIndicator());
                                case ConnectionState.done:
                                  return tempats != null ?  ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: 300
                                    ),
                                    child: IncrementallyLoadingListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      // scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      loadMoreOffsetFromBottom: 3,
                                      hasMore: () => _launchLoad,
                                      itemCount: () => tempats.length,
                                      loadMore: () async {
                                        print('load again ?');
                                        // can shorten to "loadMore: _loadMoreItems" but this syntax is used to demonstrate that
                                        // functions with parameters can also be invoked if needed
                                        await _loadData();
                                      },
                                      onLoadMore: () {
                                        setState(() {
                                          _isLoad = true;
                                          _currentPage++;
                                        });
                                      },
                                      onLoadMoreFinished: () {
                                        setState(() {
                                          _launchLoad = false;
                                          _isLoad = false;
                                        });
                                      },
                                      itemBuilder: (context, index) {
                                        if ((_isLoad ?? false) && index == tempats.length - 1) {
                                          return Column(
                                            children: [
                                              CardFoodPlace(
                                                title: tempats[index].name,
                                                imageUrl: tempats[index].photo,
                                                address: '${tempats[index].kabupatenName}, ${tempats[index].provinceName}',
                                                ratingSanitasi: tempats[index].ratingSanitasi,
                                                ratingReview: tempats[index].ratingReview,
                                                totalReview: tempats[index].review,
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, 
                                                      '/admin/tempats/show',
                                                      arguments: tempats[index].id
                                                  );
                                                },
                                              )
                                            ],
                                          );
                                        }
                                        return CardFoodPlace(
                                          title: tempats[index].name,
                                          imageUrl: tempats[index].photo,
                                          address: '${tempats[index].kabupatenName}, ${tempats[index].provinceName}',
                                          ratingSanitasi: tempats[index].ratingSanitasi,
                                          ratingReview: tempats[index].ratingReview,
                                          totalReview: tempats[index].review,
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, 
                                                '/admin/tempats/show',
                                                arguments: tempats[index].id
                                            );
                                          },
                                        );
                                      }
                                    ),
                                  ) : Text('Collecting Data...');
                                default:
                                  return Text('Something went wrong');
                              }
                            }
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        floatingActionButton: Container(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, '/admin/tempats/create');
            },
            child: Icon(Icons.add_to_photos, size: 35,),
            backgroundColor: color('primary'),
          ),
        ),
      ),
    );
  }
}