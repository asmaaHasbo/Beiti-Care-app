
import 'package:beiti_care/feature/home/presentation/screens/patient_data_screen.dart';
import 'package:beiti_care/feature/more/presentation/screens/privacy_screen.dart';
import 'package:beiti_care/feature/more/presentation/screens/withdraw_history_screen.dart';
import 'package:beiti_care/feature/splash/splash_page.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/cubit/compelete_profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/di_container.dart';
import '../../../app/domain/repo/preferences_repository.dart';
import '../../../home/presentation/widgets/bottom_nav_bar.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';
import '../widgets/menu_item.dart';
import 'about_screen.dart';
import 'all_patients_data.dart';
import 'contact_us_screen.dart';
import 'help_screen.dart';
import 'language_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 4,),
      appBar:  CustomAppBar(title: 'More'.tr()),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        children: [
          MenuItem(
            icon: Icons.info_outline,
            title: 'About'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutScreen(),));
              // TODO: Navigate to About screen
            },
          ),
          MenuItem(
            icon: Icons.phone_outlined,
            title: 'Contact Us'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsScreen(),));

              // TODO: Navigate to Contact Us screen
            },
          ),
          MenuItem(
            icon: Icons.history,
            title: 'Withdraw History'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => WithdrawHistoryScreen(),));
            },
          ),
          MenuItem(
            icon: Icons.help_outline,
            title: 'Help'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpScreen(),));
            },
          ),
          MenuItem(
            icon: Icons.language,
            title: 'Language'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LanguageScreen(),));
            },
          ),
          MenuItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Policy Privacy'.tr(),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy(),));
            },
          ),
          // MenuItem(
          //   icon: Icons.people_alt_outlined,
          //   title: 'All Patients Data'.tr(),
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) =>
          //    PatientDataScreen(),));
          //   },
          // ),

          MenuItem(
            icon: Icons.logout,
            title: 'Log out'.tr(),
            isDestructive: true,
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Log out'.tr(),
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
          TextButton(
            onPressed: () async {
           await  getIt<PreferencesRepository>()
                  .clearAll();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashPage(),));
            },
            child: Text(
              'Log out'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
