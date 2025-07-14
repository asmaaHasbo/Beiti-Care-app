part of 'app_theme.dart';

extension AppButtonTheme on AppTheme {
  textButtonTheme({required bool isDark}) => TextButtonThemeData(
        style: TextButton.styleFrom(
            // shadowColor: Colors.red,
            // backgroundColor:,
            // disabledBackgroundColor:,
            // foregroundColor:,
            // disabledForegroundColor:,

            //   surfaceTintColor:
            //       isDark ? darkCustomColors.title : darkCustomColors.title,
            //   iconColor: isDark ? darkCustomColors.title : darkCustomColors.title,
            //   textStyle: isDark
            //       ? AppFont.darkTextTheme.labelMedium
            //           ?.copyWith(fontSize: 18.sp, color: darkCustomColors.title)
            //       : AppFont.lightTextTheme.labelMedium
            //           ?.copyWith(fontSize: 18.sp, color: darkCustomColors.title),
            //   padding: PEdgeInsets.allS3,
            shape: _shape),
      );

  elevatedButtonTheme(ColorScheme scheme) => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: scheme.primary,
            foregroundColor: scheme.onPrimary,
            minimumSize: Size(double.infinity, 62.h),
            shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.r,))),
      );

  outlinedButtonTheme({required bool isDark}) => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          // backgroundColor:,
          // disabledBackgroundColor:,
          // foregroundColor:,
          // disabledForegroundColor:,

          //     textStyle: isDark
          //         ? AppFont.darkTextTheme.labelMedium
          //             ?.copyWith(fontSize: 18.sp, color: darkColorScheme.primary)
          //         : AppFont.lightTextTheme.labelMedium?.copyWith(
          //             fontSize: 18.sp, color: lightColorScheme.primary),
          //     padding: PEdgeInsets.horizontalL1,
          shape: _shape,
          //     side: BorderSide(
          //       color:
          //           isDark ? darkColorScheme.primary : lightColorScheme.primary,
          //     )
        ),
      );

  filledButtonTheme({required bool isDark}) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        // backgroundColor:,
        // disabledBackgroundColor:,
        // foregroundColor:,
        // disabledForegroundColor:,

        //   textStyle: isDark
        //       ? AppFont.darkTextTheme.labelMedium?.copyWith(fontSize: 18.sp)
        //       : AppFont.lightTextTheme.labelMedium?.copyWith(fontSize: 18.sp),
        //   padding: REdgeInsets.symmetric(
        //       vertical: LayoutConstrains.m3, horizontal: LayoutConstrains.l1),
        shape: _shape,
      ),
    );
  }

  // Color foregroundColor(bool isDark) =>
  //     isDark ? darkColorScheme.onPrimary : lightColorScheme.onPrimary;

  // Color _backgroundColor(bool isDark) =>
  //     isDark ? darkColorScheme.primary : lightColorScheme.primary;

  get _shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      );

  double get _borderRadius => 8;
}
