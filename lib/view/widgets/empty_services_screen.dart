import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyServicesScreen extends StatelessWidget {
  const EmptyServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/not_found_service.png",
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20.h),
            Text("Nothing Yet".tr(), style: TextStyle(
              color: Color(0xFF8B8B8B),
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              fontFamily: "Montserrat"
            ),
            )
          ],
        ),
      ),
    );
  }
}
