import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyRequests extends StatelessWidget {
  const EmptyRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Mailbox Illustration
          Image.asset(
            'assets/images/Group 39921.png',
            width: 300.w,
            height: 300.h,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 24.h),

          // Empty State Message
          Text(
            'You have no requests.'.tr(),
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
