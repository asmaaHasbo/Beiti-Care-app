
import 'package:beiti_care/feature/auth/presentation/pages/login_page.dart';
import 'package:beiti_care/feature/more/presentation/screens/privacy_screen.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_cubit.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_state.dart';
import 'package:beiti_care/view/widgets/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../feature/more/presentation/screens/about_screen.dart';
import '../../feature/more/presentation/screens/contact_us_screen.dart';
import '../../feature/more/presentation/screens/help_screen.dart';
import '../../feature/more/presentation/screens/language_screen.dart';
import '../../feature/more/presentation/widgets/menu_item.dart';
import '../../feature/splash/splash_page.dart';
import '../widgets/app_bar_widget.dart';


class MoreUserScreen extends StatelessWidget {
  const MoreUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResponseCubit, ResponseState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          print('Logout successful, navigating to LoginScreen');
          // التوجيه إلى صفحة تسجيل الدخول وإزالة جميع الشاشات السابقة
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Logout successful'.tr())),
          );
          // التوجيه إلى صفحة تسجيل الدخول بعد تأخير بسيط لعرض الـ SnackBar
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginPage()),
              (Route<dynamic> route) => false,
            );
          });
        } else if (state is LogoutFailureState) {
          print('error: ${state.errorMsg}');
          // عرض رسالة خطأ إذا فشل تسجيل الخروج
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('error:'.tr()+ state.errorMsg)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        bottomNavigationBar: CurvedNavigationBarWidget(
          currentIndex: 4,
        ),
        appBar: appBar(context, "More".tr()),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            MenuItem(
              icon: Icons.info_outline,
              title: 'About'.tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ));
                // TODO: Navigate to About screen
              },
            ),
            MenuItem(
              icon: Icons.phone_outlined,
              title: 'Contact Us'.tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUsScreen(),
                    ));

                // TODO: Navigate to Contact Us screen
              },
            ),
            MenuItem(
              icon: Icons.help_outline,
              title: 'Help'.tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpScreen(),
                    ));
              },
            ),
            MenuItem(
              icon: Icons.language,
              title: 'Language'.tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageScreen(),
                    ));
              },
            ),
            MenuItem(
              icon: Icons.privacy_tip_outlined,
              title: 'PolicyPrivacy'.tr(),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Privacy(),
                    ));
              },
            ),
            MenuItem(
              icon: Icons.logout,
              title: 'Log out'.tr(),
              isDestructive: true,
              onTap: () {
                print('log out taped');
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BlocBuilder<ResponseCubit, ResponseState>(
        builder: (context, state) {
          bool isLoading = state is LogoutLoadingState;

          return AlertDialog(
            title: Text(
              'Logout'.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Text(
              'Are you sure you want to logout?'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[700],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel'.tr(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              //-------------------------------- log out ---------------
              TextButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        await context.read<ResponseCubit>().logout();
                        print('start log out function');
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashPage(),));
                },
                child: isLoading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(
                        'LogOut'.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
