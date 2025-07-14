import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/session_dialog.dart';

class SessionCompleted extends StatelessWidget {
  const SessionCompleted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: CustomAppBar(title: "Tracking".tr()),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const SessionDialog();
                  },
                );

              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(390.w, 50.h),
                  padding: null,
                  backgroundColor: Color(0xFFB93439),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r))),
              child: Text(
                "Finish".tr(),
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ))
        ],
      ),
    );
  }
}
