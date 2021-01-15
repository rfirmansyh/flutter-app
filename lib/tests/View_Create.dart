import 'dart:ffi';
import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/_components/Button.dart';
import 'package:flutter_app/_components/FormControl.dart';
import 'package:flutter_app/_components/SelectSearch.dart';
import 'package:flutter_app/_models/Kabupaten.dart';
import 'package:flutter_app/_models/Province.dart';
import 'package:flutter_app/api.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter_app/_base/color.dart';
import 'package:flutter_app/_components/CardFoodPlace.dart';
import 'package:flutter_app/_components/ContainerBase.dart';
import 'package:flutter_app/_components/HeaderText.dart';
import 'package:flutter_app/_layouts/AppBarLayouts.dart';
import 'package:flutter_app/_layouts/NavbarBottom.dart';
import 'package:flutter_app/_layouts/Sidebar.dart';

class View_Create extends StatefulWidget {
  @override
  _View_CreateState createState() => _View_CreateState();
}

class _View_CreateState extends State<View_Create> {
  File _image;
  String _retrieveDataError;
  dynamic _pickImageError;
  List<Kabupaten> kabupatens;
  List<Province> provinces;
  final _formKey = GlobalKey<FormState>();
  final _kabupatenKey = GlobalKey<DropdownSearchState>();
  final _provinceKey = GlobalKey<DropdownSearchState>();
  final ImagePicker _picker = ImagePicker();


  // DATA TO SUBMIT
  Province selectedProvince;
  Kabupaten selectedKabupaten;
  PickedFile _imageFile;
  String base64Image;
  String description;
  String name;
  double rating_sanitasi;

  @override
  void initState() {
    (() async {
      // init Province
      var res = await Network().getData('/provinces');
      var body = jsonDecode(res.body);
      // print(body);
      setState(() {
        provinces = Province.fromJsonList(body['data']);
      });
      print(provinces);

      // init Kabupaten
      var res2 = await Network().getData('/kabupatens');
      var body2 = jsonDecode(res2.body);
      // print(body);
      List<Kabupaten> list2 = body2['data'].map<Kabupaten>((item) => Kabupaten.fromJson(item)).toList();
      setState(() {
        kabupatens = list2;
      });
    })();
    super.initState();
  }
 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarLayouts(is_back_nav: true, appName: 'Back'),
        body: ContainerBase(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderText.Title('Tambah Data Tempat'),
                HeaderText.Subtitle(
                  'Data Tempat Watklin',
                  margin: EdgeInsets.only(bottom: 30)
                ),
                // IMAGE UPLOAD
                Text(
                  'Foto Tempat',
                  style: TextStyle(
                    color: color('secondary'),
                    fontSize: 16
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: showImage()
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Button(
                        type: 'outline',
                        butonColor: color('primary'),
                        onPressed: () {
                          chooseImageGalery();
                        },
                        text: 'Galeri',
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Button(
                        type: 'outline',
                        butonColor: color('primary'),
                        onPressed: () {
                          chooseImageCamera();
                        },
                        text: 'Kamera',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // INPUT
                FormControl(
                  labelText: 'Nama Tempat', hintText: 'Masukan Nama Tempat',
                  validator: (value) {
                    name = value;
                    return null;
                  },
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: DropdownSearch<Province>(
                    key: _provinceKey,
                    items: provinces,
                    label: 'Pilih Provinsi',
                    popupTitle: Container(
                      padding: EdgeInsets.all(30),
                      color: color('primary'),
                      child: Text(
                        'Pilih Provinsi',
                        style: TextStyle(color: color('white')),
                      ),
                    ),
                    selectedItem: selectedProvince,
                    showSearchBox: true,
                    onFind: (String filter) {
                      provinces.where((i) => i.getName == filter);
                    },
                    onChanged: (Province data) {
                      setState(() {
                        selectedProvince = data;
                      });
                      (() async {
                        var res2 = await Network().getData('/kabupatens/getbyprovinceid/${data.getId}');
                        var body2 = jsonDecode(res2.body);
                        // print(body);
                        List<Kabupaten> list2 = body2['data'].map<Kabupaten>((item) => Kabupaten.fromJson(item)).toList();
                        setState(() {
                          kabupatens = list2;
                        });
                      })();
                    },
                    maxHeight: 420,
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  child: DropdownSearch<Kabupaten>(
                    key: _kabupatenKey,
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
                      setState(() {
                        selectedKabupaten = data;
                      });
                    },
                    maxHeight: 420,
                  ),
                ),
                FormControl(
                  labelText: 'Nilai Tempat',  
                  hintText: 'Masukan Nilai Tempat', isNumber: true,
                  validator: (value) {
                    rating_sanitasi = double.parse(value);
                    return null;
                  },
                ),
                FormControl(
                  labelText: 'Deskripsi Tempat',  
                  hintText: 'Masukan Deskripsi Tempat', 
                  isTextArea: true, 
                  margin: EdgeInsets.only(bottom: 30),
                  validator: (value) {
                    description = value;
                    return null;
                  },
                ),
                // BUTTON SUBMIT & CANCEL
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Button(
                      text: 'Batal',
                      butonColor: color('secondary-500'),
                      type: 'outline',
                      onPressed: () {},
                      margin: EdgeInsets.only(right: 10),
                    ),

                    Button(
                      text: 'Tambahkan',
                      butonColor: color('primary'),
                      type: 'solid',
                      onPressed: () {
                        // (() async {
                        //   var res = await Network().postData(
                        //     {
                        //       'photo' : File(_imageFile.path).path.split('/').last,
                        //       'image' : base64Image
                        //     }, 
                        //     '/tempats/upload'
                        //   );

                        //   var body = json.decode(res.body);
                        //   print(body);
                        // })();
                        if (_formKey.currentState.validate()) {
                          _store();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _store() async {
    

    var data = {
      'name' : name,
      'photo' : File(_imageFile.path).path.split('/').last,
      'image' : base64Image,
      'description' : description,
      'rating_sanitasi' : rating_sanitasi,
      'province_id' : selectedProvince.getId,
      'kabupaten_id' : selectedKabupaten.id
    };

    var res = await Network().postData(data, '/tempats');
    var body = await json.decode(res.body);
    print(body['data']);

    // if (body['code'] == 200){
    //   _formKey.currentState?.reset();
    //   _kabupatenKey.currentState?.changeSelectedItem(null);
    //   _provinceKey.currentState?.changeSelectedItem(null);
    // }

    
  }

  chooseImageGalery() async {
    try {
      var pickedFile = await _picker.getImage(
        source: ImageSource.gallery,
      );
      setState(() {
        _imageFile = pickedFile;
        base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  chooseImageCamera() async {
    try {
      var pickedFile = await _picker.getImage(
        source: ImageSource.camera,
      );
      setState(() {
        _imageFile = pickedFile;
        base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }
  Future<void> retrieveLostData() async {
    final LostData response = await _picker.getLostData();
    if (response.isEmpty) {
      return;
    }
    if (response.file != null) {
      setState(() {
        _imageFile = response.file;
         base64Image = base64Encode(File(_imageFile.path).readAsBytesSync());
      });
    } else {
      _retrieveDataError = response.exception.code;
    }
  }
  Widget previewImage() {
    if (_imageFile != null) {
      return  Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
              width: 8,
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor),
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 5,
                color: Colors.pink.withOpacity(0.50),
                offset: Offset(0, 5))
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(
              File(_imageFile.path)
            )
          )
        ),
      );
    } else {
      return  Container(
        width: 180,
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
              width: 8,
              color: Theme
                  .of(context)
                  .scaffoldBackgroundColor),
          boxShadow: [
            BoxShadow(
                spreadRadius: 5,
                blurRadius: 5,
                color: Colors.pink.withOpacity(0.50),
                offset: Offset(0, 5))
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/adit.JPG",
              ),
          )
        ),
      );
    }
  }
  Widget showImage() {
    return FutureBuilder<void>(
      future: retrieveLostData(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Text(
              'You have not yet picked an image.',
              textAlign: TextAlign.center,
            );
          case ConnectionState.done:
            
            return previewImage();
          default:
            if (snapshot.hasError) {
              return Text(
                'Pick image/video error: ${snapshot.error}}',
                textAlign: TextAlign.center,
              );
            } else {
              return const Text(
                'You have not yet picked an image.',
                textAlign: TextAlign.center,
              );
            }
        }
      },
    );
  }

}
