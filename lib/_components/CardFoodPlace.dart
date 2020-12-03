import 'package:flutter/material.dart';
import 'package:flutter_app/_base/color.dart';

class CardFoodPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/member/show', 
          arguments: "tesss"
        );
        print('asdf');
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 240,
        margin: EdgeInsets.only(bottom: 20.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: color('link')),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/food_places/1.png'))),
        child: FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          widthFactor: 1,
          heightFactor: .46,
          child: Container(
              padding: EdgeInsets.fromLTRB(15, 15, 12, 8),
              color: color('light'),
              child: Row(
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
                              color: color('dark'),
                              fontSize: 16.0,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 12.0),
                        child: Text('Sumbersari, Jember',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: color('secondary'),
                              fontSize: 10.0,
                            )),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(right: 4),
                              child: Icon(Icons.comment, size: 10)),
                          Text('4 Review',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: color('secondary'),
                                fontSize: 10.0,
                              )),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
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
                                      color:
                                          color('secondary'),
                                      fontSize: 8,
                                    )),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text('4.1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color:
                                          color('success'),
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.only(bottom: 2),
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
                                      color:
                                          color('secondary'),
                                      fontSize: 8,
                                    )),
                              ),
                              Expanded(
                                flex: 0,
                                child: Text('4.1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color:
                                          color('success'),
                                      fontSize: 14,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}

