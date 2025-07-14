import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title) => AppBar(
    backgroundColor: Color(0xFFF3EFEF),
    // titleSpacing: 0,
    leading: GestureDetector(
      onTap: (){
        Navigator.pop(context);
      },
      child: Image.asset(
        "assets/images/back_button.png",
        width: 24,
        height: 24,
      ),
    ),
    title: Text(title.tr(),
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFB93439), ),)

);