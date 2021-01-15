import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/_components/FormControl.dart';
import 'package:flutter_app/_models/Review.dart';
import 'package:flutter_app/_models/Sum.dart';
import 'package:flutter_app/_models/Tempat.dart';
import 'package:flutter_app/_models/User.dart';
import 'package:flutter_app/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';

import 'package:flutter_app/_layouts/AppBarLayouts.dart';

class View_Show extends StatefulWidget {
  @override
  _View_ShowState createState() => _View_ShowState();
}

class _View_ShowState extends State<View_Show> {

    var id_tempat;
    User user;
    Tempat tempat;
    List<Review> reviews;
    Sum sumRatings;

    // store review
    Review review = new Review();
    
    getUser() async {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        if (localStorage.get('user') != null) {
            setState(() {
              user = User.fromJson(json.decode(localStorage.get('user')));
            });
        } else {
            setState(() {
              user = null;
            });
        }
    }

    getTempat(id) async {
        var res = await Network().getData('/tempats/$id');
        var body = jsonDecode(res.body);
        
        // if has reviews
        if (body['data'][0]['reviews'] != null) {
            print(body['data'][0]['sum']);
            List<Review> tempListReviews = await body['data'][0]['reviews'].map<Review>((item) => Review.fromJson(item)).toList();
            Sum tempListSumRatings = await Sum.fromJson(body['data'][0]['sum']);
            setState(() {
                reviews = tempListReviews;
                sumRatings = tempListSumRatings;
            });
        }

        await setState(() {
            tempat = Tempat.fromJson(body['data'][0]);
        });

        EasyLoading.dismiss();
    }

    void initState() {
        super.initState();
        EasyLoading.show(status: 'loading...');
        getUser();
        // future that allows us to access context. function is called inside the future
        // otherwise it would be skipped and args would return null
        Future.delayed(Duration.zero, () {
        setState(() {
            id_tempat = ModalRoute.of(context).settings.arguments;
        });
        getTempat(id_tempat);
        });
    }


    void getStar(List<Widget> star) {
        for (var i = 5; i >= 1; i--) {
            star.add(Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                Container(
                    child: Text(
                    i.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: color('dark'),
                        fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(right: 10),
                ),
                Expanded(
                    child: Container(
                    height: 6,
                    color: color('link'),
                    child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: sumRatings != null ? double.parse(sumRatings.toJson()['sum_$i']) : 0,
                        heightFactor: 1,
                        child: Container(
                        color: color('primary'),
                        ),
                    ),
                    ),
                )
                ],
            ));
        }
    }


    @override
    Widget build(BuildContext context) {

        List<Widget> star = new List<Widget>();
        getStar(star);
        

        return Scaffold(
        appBar: AppBarLayouts(
          appName: 'Back', is_back_nav: true,
          onBack: () {
            Navigator.pushNamed(context, '/admin/tempats');
          },
        ),
        body: ContainerBase(
            child: tempat == null ? Text('waiting dat..') : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                // GAMBAR TEMPAT
                Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                margin: EdgeInsets.only(bottom: 20.0),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: color('link')),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: tempat.photo != null ? NetworkImage(Network().getImageUrl()+tempat.photo) :  AssetImage('images/food_places/default.png'),
                    )
                )
                ),
                // NAMA TEMPAT
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Text(tempat.name,
                                style: TextStyle(
                                fontWeight: FontWeight.w800,
                                decoration: TextDecoration.underline,
                                color: color('dark'),
                                fontSize: 16.0,
                                )),
                        ),
                        Container(
                            child: Text('${tempat.kabupatenName}, ${tempat.provinceName}',
                                style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color('secondary'),
                                fontSize: 10.0,
                                )),
                        ),
                        ],
                    ),
                    ),
                    ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(bottom: 5),
                        color: color('link'),
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
                                    color: color('secondary'),
                                    fontSize: 8,
                                )),
                            ),
                            Expanded(
                            flex: 0,
                            child: Text(tempat.ratingSanitasi != null ? tempat.ratingSanitasi.toString() : '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: color('success'),
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
                    child: Divider(color: color('secondary-500'))),
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
                                color: color('dark'),
                                fontSize: 14.0,
                                )),
                        ),
                        Container(
                            width: 180,
                            child: Text('Nilai dari mereka yang sudah berkunjung',
                                style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color('secondary'),
                                fontSize: 10.0,
                                )),
                        ),
                        ],
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
                        color: color('link'),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(bottom: 5),
                                child: Text(
                                tempat.ratingReview != null ? tempat.ratingReview.toStringAsFixed(2) : '0',
                                style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: color('success'),
                                    fontSize: 24,
                                ),
                                ),
                            ),
                            Text(
                                tempat.review != null ? tempat.review.toString() : '0',
                                style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: color('secondary'),
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
                reviews != null ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: reviews.length,
                    itemBuilder: (context, i) {
                        return CardComment(
                            imgUrl: reviews[i].photo,
                            name: reviews[i].name,
                            date: reviews[i].createdAt,
                            rating: reviews[i].rating,
                            body: reviews[i].body,
                        );
                    },
                ) : Text('No Reviews...'),
            ]
            )
        ),
        );
    }
}

class CardComment extends StatelessWidget {
    String imgUrl;
    String name;
    DateTime date;
    String body;
    double rating;

    CardComment({
        Key key,
        @required this.imgUrl,
        @required this.name,
        @required this.date,
        @required this.body,
        @required this.rating
    }) : super(key: key);

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
                                Border.all(color: color('link')),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: imgUrl != null && imgUrl != '' ? NetworkImage(imgUrl) : AssetImage('images/users/default-user.png')
                            )
                        ),
                    ),
                    Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(bottom: 4.0),
                            child: Text('$name',
                                style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: color('dark'),
                                fontSize: 14.0,
                                )),
                        ),
                        Container(
                            width: 180,
                            child: Text('$date',
                                style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color('secondary'),
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
                allowHalfRating: true,
                isReadOnly: true,
                starCount: 5,
                rating: rating,
                size: 20.0,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                color: color('primary'),
                borderColor: color('primary'),
                spacing: 0.0),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                '$body',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: color('secondary')),
                ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Divider(color: color('secondary-500'))),
            ],
        ),
        );
    }
}
