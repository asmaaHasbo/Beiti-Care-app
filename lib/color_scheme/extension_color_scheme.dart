import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {


  Color get offWhite =>
      getColor(
          light: const Color(0xffF9F9F9),
          dark: const Color(0xffF9F9F9));

  Color get containerColorProfile =>
      getColor(
          light: const Color(0xffEBEAEA),
          dark: const Color(0xffEBEAEA));

  Color get textTitle =>
      getColor(light: const Color( 0xff333333
      ), dark: const Color(0xff333333));

  Color get containerColor=>
  getColor(light: const Color(0xffDDDDDD), dark: const Color(0xffDDDDDD),);


  Color get textCardProfileColor=>
      getColor(light: const Color(0xff969295), dark: const Color(0xff969295),);



  ///Helper Method
  Color getColor({required Color light, required Color dark}) =>
      brightness == Brightness.light ? light : dark;
}


