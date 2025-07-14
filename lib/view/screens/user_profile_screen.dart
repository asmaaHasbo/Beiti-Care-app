import 'package:beiti_care/view/screens/therapeutic_examinations_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/curved_navigation_bar.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_services.dart';
import '../widgets/profile_status_widget.dart';
import 'edit_profile_screen.dart';
import 'history_screen.dart';
import 'medical_tests_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> profileServices = [
      ProfileServices(
          title: "Edit Profile".tr(),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => EditProfileScreen()))),
      ProfileServices(
          title: "Medical Tests".tr(),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => MedicalTestsScreen()))),
      ProfileServices(
          title: "History".tr(),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HistoryScreen()))),
      ProfileServices(
          title: "Therapeutic examinations".tr(),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TherapeuticExaminationsScreen())))
    ];
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Profile".tr()),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(children: [
            ProfileHeaderWidget(),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                  color: Color(0xFFE3E1E1),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Color(0xFF49768C), width: 0.6.w)),
              child: ProfileStatusWidget(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView(
                children: profileServices,
              ),
            )
          ])),
      bottomNavigationBar: CurvedNavigationBarWidget(
        currentIndex: 2,
      ),
    );
  }
}
