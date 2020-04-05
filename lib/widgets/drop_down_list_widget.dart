import 'package:flutter/material.dart';
import 'package:survival_kit/entities/user.dart';

class DropDownList extends StatefulWidget {
  final List<int> items;
  final String lableText;
  final User user;

  DropDownList({this.items, this.lableText, this.user});

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  int _selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonFormField<int>(
        decoration: InputDecoration(labelText: widget.lableText),
        value: _selectedItem,
        items: widget.items.map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text(value.toString()),
          );
        }).toList(),
        onChanged: (item) {
          setState(() {
            _selectedItem = item;
          });
        },
        onSaved: (input) => widget.user.roleName = input,
      ),
    );
  }
}
