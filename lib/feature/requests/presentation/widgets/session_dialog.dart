import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/screens/patient_data_screen.dart';

class SessionDialog extends StatefulWidget {
  const SessionDialog({super.key});

  @override
  State<SessionDialog> createState() => _SessionDialogState();
}

class _SessionDialogState extends State<SessionDialog> {

  late AnimationController _controller;



  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        width: 274.w,
        height: 450.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.0.w),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 96.h,
              width: 100.w,
            ),
            SizedBox(height: 15.h),

            ClipOval(
              child: Image.asset(
                'assets/images/nurse_image.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 15.h),



            SizedBox(height: 20.h),

            SizedBox(
              width: 180.w,
              child: Text(
                "waiting_for_nurse_approval".tr(),
                style: TextStyle(
                    color: Color(0xFF8B8B8B),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 15.h),


            SizedBox(height: 15.h),
            ElevatedButton(
              onPressed: () {

                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => PatientDataScreen()
                ));

              },
              style: ElevatedButton.styleFrom(
                fixedSize:  Size(141.w, 50.r),
                backgroundColor: Color(0xFF8B8B8B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'patient_data'.tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


