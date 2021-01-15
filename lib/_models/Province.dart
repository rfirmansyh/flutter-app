import 'package:flutter_app/api.dart';

class Province {
  int _id;
  String _name;

  Province({int id, String imageurl, String name, String nim}) : 
    _id = id, _name = name,
    assert(id != null), assert(name != null);

  // void set id(int id) => _id = id;

  get getId {
    return this._id;
  }

  get getName {
    return this._name;
  }

  factory Province.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return Province(
      id: json['id'],
      name: json['name']
    );
  }

  static List<Province> fromJsonList(List list) {
    if (list == null) return null;
    return list.map((item) => Province.fromJson(item)).toList();
  }


  @override
  String toString() => _name;
}