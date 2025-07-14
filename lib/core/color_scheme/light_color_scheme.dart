import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme.light(
  primary: Color(0xFFb93439),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xffA09C9C),
  onPrimaryContainer: Color(0xffF7F7F7),
  secondary: Color(0xFF305868),
  onSecondary: Color(0xFFF1F1F1),
  tertiary: Color(0xff49768c),
  onTertiary: Color(0xFF666666),
  error: Color(0xFF930000),
  errorContainer: Color(0xFF8C1D18),
  onError: Color(0xFF601410),
  onErrorContainer: Color(0xFFF9DEDC),
  surface: Color(0xFFF3EFEF),
  onSurface: Color(0xFFE0E3E3),
  surfaceContainerHighest: Color(0xFF49454F),
  onSurfaceVariant: Color(0xFFCAC4D0),
  outline: Color(0xff9E9E9E),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE0E3E3),
  shadow: Color(0xFF000000),
  inversePrimary: Color(0xFF222222),
  onSecondaryContainer: Color(0xFF333333),
  tertiaryContainer: Color(0xFF454545),
);

extension ColorExtension on Color {
  Color? get getOnColor {
    switch (value) {
      case 0xFFFB5607:
        return lightColorScheme.onPrimary;
      case 0xFFF3F3F3:
        return const Color(0xff023047);
      default:
        return null;
    }
  }
}
