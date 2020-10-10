import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Pertama Hehe'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              print('clicked');
            },
          ),
        ],
      ),
      body: Container(
        // child: FittedBox(),
        // child: ListView(),
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              'https://strattonapps.com/wp-content/uploads/2020/02/flutter-logo-5086DD11C5-seeklogo.com_.png',
              width: 100.0,
              height: 200.0,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/cute.gif',
              width: 100.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            Text(
              'Latihan Pertama',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.red[100]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    width: 240,
                    height: 120,
                    child: Text('lkasjdf;asfd'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }

  children(Text text, Text text2) {}
}