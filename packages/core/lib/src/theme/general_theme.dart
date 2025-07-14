part of 'app_theme.dart';

extension AppThemeExtension on AppTheme {


  ///light
  ThemeData get lightTheme => ThemeData(
        /// to set background color for BottomNavigation see  [https://stackoverflow.com/questions/49307858/style-bottomnavigationbar-in-flutter]
        canvasColor: lightColorScheme.surface,
        
        brightness: Brightness.light,
        primaryColor: lightColorScheme.primary,
        scaffoldBackgroundColor: lightColorScheme.surface,
    //    tabBarTheme: tabBarTheme(lightColorScheme),
        textTheme: textTheme,
        colorScheme: lightColorScheme,
        floatingActionButtonTheme: floatingActionButtonTheme(isDark: false),
        textButtonTheme: textButtonTheme(isDark: false),
        elevatedButtonTheme: elevatedButtonTheme(lightColorScheme),
        outlinedButtonTheme: outlinedButtonTheme(isDark: false),
        checkboxTheme: checkboxThemeData(isDark: false),
        appBarTheme: appBarTheme(lightColorScheme),
        inputDecorationTheme: inputDecoration(isDark: false),
        iconTheme: iconTheme(lightColorScheme),
      //  cardTheme: cardTheme(lightColorScheme),
        filledButtonTheme: filledButtonTheme(isDark: false),
        listTileTheme: listTileTheme(isDark: false),
        navigationBarTheme: navigationBarTheme(isDark: false),
        dividerTheme: dividerTheme(lightColorScheme),
      );
}
