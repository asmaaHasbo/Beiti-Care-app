import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/examination_widget.dart';
import 'ecg_screen.dart';

class FunctionalTestsScreen extends StatelessWidget {
  const FunctionalTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: appBar(context, "Functional tests".tr()),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExaminationWidget(
                image: Image.asset(
                  "assets/images/ecg.png",
                  width: 100.w,
                  height: 127.h,
                  fit: BoxFit.fill,
                ),
                title: 'ECG',
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                date: "Date : 2/2/2025",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EcgScreen()));
                },
              ),
              SizedBox(
                height: 10.h,
              ),
              ExaminationWidget(
                image: Image.asset(
                  "assets/images/xray.png",
                  width: 100.w,
                  height: 127.h,
                  fit: BoxFit.fill,
                ),
                title: 'Lung functions',
                description:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                date: "Date : 2/2/2025",
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => MagneticResonanceImaging()));
                },
              ),
            ],
          ),
        )
        );
  }
}
