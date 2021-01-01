import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class Network {
  final String _url = 'http://192.168.42.10:8000/api/v1';
  final String _imageUrl = 'http://192.168.42.10:8000/storage/';

  var token;

  String getImageUrl() {
    return this._imageUrl;
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'));
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.Client().post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    print(jsonEncode(data));
    return await http.Client().post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders()
    );
  }

  authPostData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      fullUrl,
      body: data == null ? null : jsonEncode(data),
      headers: _setHeaders()
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(
      fullUrl,
    );
  }

  authGetData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };
}