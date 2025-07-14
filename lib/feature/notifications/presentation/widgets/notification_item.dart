import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItem extends StatelessWidget {
  final String message;
  final bool isRead;
  // final IconData icon;
  // final Color iconColor;

  const NotificationItem({
    super.key,
    required this.message,
    required this.isRead,
    // required this.icon,
    // required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            // Notification Icon
            // Container(
            //   width: 40.w,
            //   height: 40.w,
            //   decoration: BoxDecoration(
            //     color: iconColor.withOpacity(0.1),
            //     shape: BoxShape.circle,
            //   ),
            //   child: Icon(
            //     icon,
            //     color: iconColor,
            //     size: 30.w,
            //   ),
            // ),
            // SizedBox(width: 12.w),

            // Notification Message
            Expanded(
              child: Row(
                children: [

                  Image.asset(
                    "assets/images/app_logo.png",
                    width: 50,
                    height: 50,),
                  // Text(
                  //   'بني فير',
                  //   style: TextStyle(
                  //     fontSize: 12.sp,
                  //     color: Colors.grey[600],
                  //   ),
                  // ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      message,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Unread Indicator
            if (!isRead)
              Container(
                width: 8.w,
                height: 8.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
