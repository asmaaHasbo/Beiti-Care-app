import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/profile_services.dart';
import 'functional_tests_screen.dart';
import 'genetic_testing_screen.dart';
import 'imaging_tests_screen.dart';
import 'laboratory_tests_screen.dart';

class TherapeuticExaminationsScreen extends StatelessWidget {
  const TherapeuticExaminationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> profileServices = [
      ProfileServices(
          title: "Laboratory tests".tr(),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LaboratoryTestsScreen()))),
      ProfileServices(
          title: "Imaging tests".tr(),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ImagingTestsScreen()))),
      ProfileServices(
          title: "Functional tests".tr(),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FunctionalTestsScreen()))),
      ProfileServices(
          title: "Genetic testing".tr(),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => GeneticTestingScreen())))
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Therapeutic examinations".tr()),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          child: Column(children: [
            SizedBox(height: 10.h),
            Expanded(
              child: ListView(
                children: profileServices,
              ),
            )
          ])),
    );
  }
}
