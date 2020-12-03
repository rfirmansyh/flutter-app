import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:flutter_app/_base/color.dart';


class FormControl extends StatefulWidget {
  String labelText;
  String hintText;
  bool isPasswordField;
  bool isTextArea;
  IconData prefixIcon;
  IconData suffixIcon;
  EdgeInsets margin;
  Function onChange;
  Function onSubmitted;

  FormControl({
    Key key,
    @required this.labelText,
    @required this.hintText,
    this.isTextArea = false,
    this.isPasswordField = false,
    this.margin,
    this.prefixIcon,
    this.suffixIcon,
    this.onChange,
    this.onSubmitted
  }) : super(key: key);

  @override
  _FormControlState createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  FocusNode _focusNode = new FocusNode();
  bool _isHidePass = false;

  @override
  void initState() {
    super.initState();
    if (widget.isPasswordField) {
      _isHidePass = true;
    } else {
      _isHidePass = false;
    }
  }

  getPrefixIcon() {
    if (widget.prefixIcon != null) {
      return Icon(
        widget.prefixIcon,
        color: _focusNode.hasFocus ? color('primary') : color('secondary-500'),
      );
    } else {
      return null;
    }
  }
  getSuffixIcon() {
    if (widget.isPasswordField) {
      return GestureDetector(
        onTap: () {
          setState(() {
            _isHidePass = !_isHidePass;
          });
        },
        child: Icon(
          Icons.remove_red_eye,
          color: color('secondary-500'),
        ),
      );
    } else {
      if (widget.suffixIcon != null) {
        return Icon(
          widget.suffixIcon,
          color: _focusNode.hasFocus ? color('primary') : color('secondary-500'),
        );
      } else {
        return null;
      }
    }
    
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: widget.margin != null ? widget.margin : EdgeInsets.only(bottom: 10),
      child: TextField(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        focusNode: _focusNode,
        onChanged: widget.onChange,
        onSubmitted: widget.onSubmitted,
        obscureText: _isHidePass,
        maxLines: null,
        keyboardType: widget.isTextArea ? TextInputType.multiline : TextInputType.text,
        decoration: InputDecoration(
          fillColor: color('light'),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color('secondary-500'),
            ),
          ),
          labelText: widget.labelText,
          prefixIcon: this.getPrefixIcon(),
          suffixIcon: this.getSuffixIcon(),
          labelStyle: TextStyle(
            color: _focusNode.hasFocus ? color('primary') : color('secondary-500'),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle (
            color: color('secondary-500'),
            fontSize: 14.0
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color('primary')
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10, horizontal: 10
          )
        ),
      ),
    );
  }
}