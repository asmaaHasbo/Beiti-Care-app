import 'dart:async';
import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/constants/prefs_key.dart';
import '../../core/di/di_container.dart';
import '../../view/screens/cubit/requests_cubit.dart';
import '../../view/screens/cubit/services_cubit.dart';
import '../../view/screens/welcome_screen.dart';
import '../app/domain/repo/preferences_repository.dart';
import '../home/presentation/screens/home_screen.dart';
import 'fingerprint_page.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  // Timer? _myTimer;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward();

    _navigateAfterDelay();
  }

  Future<void> _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 3));

    // final String? token = getIt<PreferencesRepository>().getString(PrefsKey.token);
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) return;

    if (prefs.containsKey("nurseRole")) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else if (prefs.containsKey("clientRole")) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => MultiBlocProvider(providers: [
                    BlocProvider(
                        create: (context) =>
                            RequestsCubit(NadaDioConsumer(dio: Dio()))),
                    BlocProvider(
                        create: (context) =>
                            ServicesCubit(NadaDioConsumer(dio: Dio()))
                              ..getServices()),
                  ], child: WelcomeScreen())));

    } else {
      // الحالة الافتراضية لو مفيش أي شرط من اللي فوق اتحقق
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FingerprintPage(),
        ),
      );
    }
  }
// =======
//     final String? token = getIt<PreferencesRepository>().getString(PrefsKey.token);
//     String role=getIt<PreferencesRepository>()
//         .getString('role')??'';
//
//     if (!mounted) return;
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => token == null ? const FingerprintPage() :    role=='client'? WelcomeScreen():HomeScreen(),
//
//
//
//       ),
//     );
// >>>>>>> batoul_new
//   }

  @override
  void dispose() {
    _animationController.dispose();
    // _myTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/app_logo_large.png',
                height: 300.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
