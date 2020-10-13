import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Developer {
  int _id;
  String _imageurl;
  String _name;
  String _nim;

  Developer({int id, String imageurl, String name, String nim}) : 
    _id = id, _imageurl = imageurl, _name = name, _nim = nim,
    assert(id != null), assert(imageurl != null), assert(name != null), assert(nim != null);

  // void set id(int id) => _id = id;

  get getId {
    return this._id;
  }

  get getImageurl {
    return this._imageurl;
  }

  get getName {
    return this._name;
  }

  get getNim {
    return this._nim;
  }
}

class DeveloperList {
  List<Developer> developerList = [
    Developer(
      id: 0,
      imageurl: 'images/misc/png/dev_firman.png',
      name: 'Rahmad Firmansyah',
      nim: '182410102024'
    ),
    Developer(
      id: 0,
      imageurl: 'images/misc/png/dev_dinda.png',
      name: 'Dinda Dikrima Adi',
      nim: '182410102009'
    ),
    Developer(
      id: 0,
      imageurl: 'images/misc/png/dev_gisty.png',
      name: 'Augisty Wardah Faradisa',
      nim: '182410102029'
    ),
    Developer(
      id: 0,
      imageurl: 'images/misc/png/dev_tiar.png',
      name: 'Bahtiar Eka Ady Candra',
      nim: '182410102090'
    )
  ];

  List get list {
    return developerList;
  }
}
