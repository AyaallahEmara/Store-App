import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap,required this.bottonText}) ;
  VoidCallback? onTap;
  String bottonText;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(8),
          ),
          width: double.infinity,
          height: 50,
          child: Center(child: Text('$bottonText',style:
            TextStyle(
              color: Colors.white,
              fontFamily: 'pacifico',
              fontSize: 20,
            ),),
          )
      ),
    );
  }
}
