import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/_base/Variable.dart';
import 'package:flutter_app/_components/HeaderText.dart';

import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hexcolor/hexcolor.dart';

class CameraPreview extends StatefulWidget {
  CameraPreview({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CameraPreviewState createState() => _CameraPreviewState();
}

class _CameraPreviewState extends State<CameraPreview> {
  File _image;
  File _gallery;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image as File;
      _gallery = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusNode _currentNode = new FocusNode();

    return Scaffold(
      appBar: AppBarLayouts(appName: 'Watklin'),
      body: new Container(
        child: new Column(
          children: <Widget>[
            HeaderText.Title("Tambah Data Sanitasi"),
            HeaderText.Subtitle("Jember, Jawa Timur"),
            Container(
                padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: "Masukan Nama",
                      labelText: "Nama Tempat Makan",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: "Masukan Alamat",
                      labelText: "Alamat",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                )),
            Container(
                padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
                child: new TextField(
                  decoration: new InputDecoration(
                      hintText: "Masukan Nilai Sanitasi",
                      labelText: "Nilai Sanitasi",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
            ),
            Container(
                height: 200,
                width: 300,
                child: _image == null
                    ? Text("Image is not loaded")
                    : Image.file(_image)),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 18, 25, 8),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/member');
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
                'Simpan',
                style: TextStyle(
                    color: HexColor(Variable.color('white')),
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: NavbarBottom(),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
