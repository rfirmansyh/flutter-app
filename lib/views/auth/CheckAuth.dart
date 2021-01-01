import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CheckAuth extends StatefulWidget {
  static Future<bool> user() async {
    bool isAuth = false;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if(token != null){
      isAuth = true;
    }
    return isAuth;
  }
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool _isAuth = false;
  bool _isLoad = true;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn(){
    EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.threeBounce;
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.progressColor = Colors.white;
    EasyLoading.instance.indicatorColor = Colors.white;
    EasyLoading.instance.backgroundColor = Colors.black12;
    EasyLoading.instance.textColor = Colors.black12;
    EasyLoading.show();

    var future = new Future.delayed(const Duration(milliseconds: 5000), () async {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var token = localStorage.getString('token');

      if(token != null){
        setState(() {
          _isAuth = true;
        });
      }

      if (_isAuth == true) {
        Navigator.pushNamed(context, '/tempats');
      } else {
        Navigator.pushNamed(context, '/login');
      }

      EasyLoading.dismiss();
    }
      
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(''),
    );
  }
}