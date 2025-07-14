import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/examination_widget.dart';
import 'magnetic_imaging_screen.dart';

class ImagingTestsScreen extends StatelessWidget {
  const ImagingTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: appBar(
          context, "Imaging tests".tr(),
        ),
        body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
            child: Column(children: [
              SizedBox(
                  width: double.infinity,
                  height: 750.h,
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          ExaminationWidget(
                            image: Image.asset(
                              "assets/images/imaging_background.png",
                              width: 100.w,
                              height: 120.h,
                              fit: BoxFit.fill,
                            ),
                            title: "Magnetic resonance imaging",
                            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            date: "Date : 2/2/2025",
                            onTap: () {
                              Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => MagneticResonanceImaging()));
                            },),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      );
                    },
                  ))
            ])));
  }
}
