import 'package:beiti_care/feature/splash/splash_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:beiti_care/common/constants/constants.dart';
import 'package:beiti_care/services/localization_service.dart';
import 'package:beiti_care/services/service_provider.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'services/language_service.dart';
import 'package:beiti_care/core/color_scheme/light_color_scheme.dart';

class App extends StatelessWidget {
  const App({super.key});
  static final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: ScreenUtilInit(
        designSize: designSize,
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, child) => LocalizationService(
          child: Builder(builder: (context) {
            LanguageService(context);
            final theme = AppTheme.init(
              lightColorScheme: lightColorScheme,
            );
            return ServiceProvider(
              child: MaterialApp(
                title: 'Beti Care'.tr(),
                debugShowCheckedModeBanner: false,
                home: SplashPage(),
                locale: context.locale,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                theme: theme.lightTheme,
                builder: BotToastInit(),
                  // initialRoute: '/',
                  // onGenerateRoute: (settings) {
                  //   if (settings.name == '/nutritionNurses') {
                  //     final idServices = settings.arguments as String?;
                  //     return MaterialPageRoute(
                  //       builder: (context) => NutritionNursesScreen(idServices: idServices),
                  //     );
                  //   }
                  //   // Default fallback
                  //   return MaterialPageRoute(builder: (context) => const WelcomeScreen());
    // }
              ),
            );
          }),
        ),
      ),
    );
  }
}
