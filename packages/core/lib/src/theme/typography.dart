part of "app_theme.dart";

const _package = 'design';

TextTheme textTheme = TextTheme(
  displayLarge: TextStyle(
      fontFamily: 'Montserrat', fontSize: 52.sp),
  displayMedium: TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 34.0.sp,
      ),
  displaySmall: TextStyle(
      fontFamily: 'Montserrat', fontSize: 40.0.sp, ),

  /// headline
  headlineLarge: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 32.sp,
    color: const Color(0xff023047),

  ),
  headlineMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 28.0.sp,
    color: const Color(0xff023047),
  ),
  headlineSmall: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 25.0.sp,
    color: const Color(0xff023047),
  ),

  ///Title
  titleLarge: TextStyle(
      fontFamily: 'Montserrat', fontSize: 20.0.sp, fontWeight: FontWeight.w400),
  titleMedium: TextStyle(
      fontFamily: 'Montserrat', fontSize: 13.0.sp, fontWeight: FontWeight.w500),
  titleSmall: TextStyle(
      fontFamily: 'Montserrat', fontSize: 12.0.sp, fontWeight: FontWeight.w300),

  ///Label
  labelLarge: TextStyle(
      fontFamily: 'Montserrat', fontSize: 13.0.sp, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w300,
    height: 24.fromFigmaHeight(18),
  ),
  labelSmall: TextStyle(
      fontFamily: 'Montserrat', fontSize: 12.0.sp, fontWeight: FontWeight.w300),

  ///Body
  bodyLarge: TextStyle(
      fontFamily: 'Montserrat', fontSize: 16.0.sp, fontWeight: FontWeight.w600),
  bodyMedium: TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    height: 24.fromFigmaHeight(16),
  ),
  bodySmall: TextStyle(
      fontFamily: 'Montserrat', fontSize: 10.0.sp, fontWeight: FontWeight.w400),
);

//?  Design text styles
extension TextThemeExtension on TextTheme {
  TextStyle get salaryText => TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      fontSize: 15.sp,
      height: 27.fromFigmaHeight(16));

  TextStyle get paragraphMedium => TextStyle(
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.normal,
      fontSize: 14.sp,
      height: 20.fromFigmaHeight(14));

  TextStyle get buttonText => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 20.fromFigmaHeight(14),
      );

  TextStyle get dropDownText => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        height: 27.fromFigmaHeight(14),
      );

  TextStyle get appBarTitle => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        letterSpacing: -0.41.w,
        height: 22.fromFigmaHeight(16),
      );

  TextStyle get informerText => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        letterSpacing: -0.5.w,
        height: 16.fromFigmaHeight(12),
      );

  TextStyle get ratingText => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 14.sp,
        letterSpacing: -0.5.w,
        height: 18.9.fromFigmaHeight(14),
      );

  TextStyle get ratingNumber => TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w500,
        fontSize: 10.sp,
        letterSpacing: -0.5.w,
        height: 13.5.fromFigmaHeight(10),
      );

  ///            <<< NEW TEXT STYLE >>
  /// this text is need to set weight[]  from [FamilyUtils] extension
  TextStyle get display => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 32.sp,
        letterSpacing: -0.16.w,
        height: 40.fromFigmaHeight(32),
      );

  TextStyle get heading => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 24.sp,
        letterSpacing: -0.16.w,
        height: 32.fromFigmaHeight(24),
      );

  TextStyle get labelItem => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 18.sp,
        letterSpacing: -0.3.w,
        fontWeight: FontWeight.w400,
        height: 33.fromFigmaHeight(18),
      );

  TextStyle get body => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 16.sp,
        letterSpacing: -0.16.w,
        height: 24.fromFigmaHeight(16),
      );

  TextStyle get paragraph => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 14.sp,
        letterSpacing: -0.16.w,
        height: 20.fromFigmaHeight(14),
      );

  TextStyle get footnote => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        letterSpacing: -0.16.w,
        height: 16.fromFigmaHeight(12),
      );

  TextStyle get xs => TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12.sp,
        height: 18.fromFigmaHeight(12),
      );
}

extension FamilyUtils on TextStyle {
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
}

class HelperFont {
  static FontWeight? w440 =
      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.4);

  static FontWeight? w430 =
      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.3);

  static FontWeight? w460 =
      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.6);

  static FontWeight? w428 =
      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.28);

  static FontWeight? w472 =
      FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.72);

  static FontWeight? w536 =
      FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.36);
}
