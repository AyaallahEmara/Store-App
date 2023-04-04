import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.onChanged,this.hintText,this.textInputType}) ;
  String? hintText;
  Function(String)? onChanged;
  TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return  TextField(
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'pacifico',
          fontSize: 20,
        ),
      ),
    );
  }
}
