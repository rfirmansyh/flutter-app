import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';

import 'package:flutter_app/_base/color.dart';

class SelectSearch extends StatelessWidget {

  List<DropdownMenuItem> items = [];
  String hint;
  String value;
  Function validator;
  Function onChange;
  EdgeInsets margin;

  SelectSearch({
    Key key,
    @required this.items,
    @required this.hint,
    @required this.value,
    @required this.onChange,
    this.margin,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin == null ? EdgeInsets.only(bottom: 10) : this.margin,
      padding: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: color('secondary-500'))
      ),
      child: SearchableDropdown.single(
        items: this.items,
        value: this.value,
        hint: this.hint,
        underline: Container(
          height: 0,
        ),
        selectedValueWidgetFn: (item) {
          return Container(
            alignment: Alignment.bottomLeft,
            child: Text(item.toString())
          );
        },
        searchHint: this.hint,
        onChanged: this.onChange,
        isExpanded: true,
      ),
    );
  }
}