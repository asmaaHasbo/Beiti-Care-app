import 'package:core/src/theme/extension.dart';
import 'package:core/src/theme/extension_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

part 'app_button_theme.dart';

part 'general_theme.dart';

part 'typography.dart';

class AppTheme {
  //TODO init only once
  AppTheme.init({
    required this.lightColorScheme,
  });

  final ColorScheme lightColorScheme;

  ///Appbar
  ///todo only need to set responsive value
  AppBarTheme appBarTheme(ColorScheme scheme) => AppBarTheme(
      backgroundColor: scheme.primary,
      toolbarHeight: 53,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarDividerColor: scheme.surface,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: scheme.surface,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
      elevation: 0,
      foregroundColor: scheme.onPrimary,
      centerTitle: true,
      iconTheme: IconThemeData(size: 24.r, color: scheme.onPrimary));

  ///CheckBox
  CheckboxThemeData checkboxThemeData({required bool isDark}) =>
      const CheckboxThemeData(

          );

  /// Icon
  IconThemeData iconTheme(ColorScheme scheme) => IconThemeData(
        size: 20.r,
        color: scheme.primary,
      );

  ///Chip
  ChipThemeData chipTheme(ColorScheme scheme) => ChipThemeData(
      padding: REdgeInsets.only(top: 6, left: 24, right: 24),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.r),
      ),
      side: BorderSide.none,
      showCheckmark: false,
      selectedColor: scheme.primary,
      labelStyle: textTheme.appBarTitle.copyWith(
        height: 17.fromFigmaHeight(16),
        color: scheme.brandPrimary.shade300,
      ),
      color: WidgetStateProperty.resolveWith(
        (states) {
          if (states.contains(WidgetState.selected)) {
            return scheme.brandPrimary.shade25;
          }
          return scheme.systemGray.shade25;
        },
      )

      );

  ///FloatingActionButtonThemeData
  FloatingActionButtonThemeData floatingActionButtonTheme(
          {required bool isDark}) =>
      const FloatingActionButtonThemeData(

          );

  ///TabBarTheme
  TabBarTheme tabBarTheme(ColorScheme scheme) => TabBarTheme(
        labelColor: scheme.secondary,
        unselectedLabelColor: scheme.onSecondary,
      );



  ///cardTheme
  CardTheme cardTheme(ColorScheme scheme) => CardTheme(
        color: scheme.surface, elevation: 0,
    surfaceTintColor: Colors.white,


      );



  ///listTileTheme
  ListTileThemeData listTileTheme({required bool isDark}) =>
      const ListTileThemeData(
          // horizontalTitleGap: 0,
          // contentPadding: PEdgeInsets.allS3,
          );

  DividerThemeData dividerTheme(ColorScheme scheme) => DividerThemeData(
      color: scheme.outline,
      endIndent: 0,
      indent: 0,
      thickness: 1.r,
      space: 20.r);

  ///navigationBarTheme
  NavigationBarThemeData navigationBarTheme({required bool isDark}) =>
      const NavigationBarThemeData(

          );

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme scheme) =>
      BottomNavigationBarThemeData(
        selectedItemColor: scheme.primary,
        unselectedItemColor: scheme.secondary,

        ///todo change bodyMedium to the size used in app
        selectedLabelStyle:
            textTheme.bodyMedium?.copyWith(color: scheme.primary),
        unselectedIconTheme: IconThemeData(size: 25, color: scheme.secondary),
        selectedIconTheme: IconThemeData(size: 25, color: scheme.primary),
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 0,
        backgroundColor: scheme.surface,
      );

  InputDecorationTheme inputDecoration({required bool isDark}) {
    ///todo add border color
    /////todo make width border responsive v
    const inputBorderRadius = BorderRadius.all(Radius.circular(12.0));
    return const InputDecorationTheme(
      contentPadding: EdgeInsets.all(16),

      ///contentPadding will be set in the widget because is different in every state

      constraints: BoxConstraints(maxHeight: 56, minHeight: 56),

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        borderRadius: inputBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: inputBorderRadius,
      ),

    );
  }
}
