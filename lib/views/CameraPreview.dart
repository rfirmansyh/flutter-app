import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:image_picker/image_picker.dart';

class CameraPreview extends StatefulWidget {
  CameraPreview ({Key key, this.title}) : super(key: key);

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

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarLayouts(appName: 'Watklin'),
      body: Center(
          child: _image == null ? Text("Image is not loaded") : Image.file(_image)
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
