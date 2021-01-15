import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz'),
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
        height: 280,
        child: Text(
          'Ini Teks Berwarna dan berukuran 32px',
          style: TextStyle(
            fontSize: 34,
            color: Colors.pink
          ),
        )
        
      ),
    );
  }

}
