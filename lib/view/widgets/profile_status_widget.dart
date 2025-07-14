import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileStatusWidget extends StatelessWidget {
  const ProfileStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: -3.14,
                  child: SizedBox(
                      width: 65.w,
                      height: 65.h,
                      child: CircularProgressIndicator(
                        value: 0.7,
                        strokeWidth: 18.w,
                        backgroundColor:
                        Color(0xFFE3E1E1),// light background circle
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFFB93439), // red progress
                        ),)
                  ),
                ),
                 Text(
                  '70 %',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                    fontFamily: "Montserrat",
                    color:  Color(0xFFB93439),
                  ),
                ),
              ],
            ),
           SizedBox(
              width: 15.w,
            ),
             Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Complete your profile'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        fontFamily: "Montserrat",
                        color:  Color( 0xFF49768C),
                      )),
                  SizedBox(height: 5.h,),
                  Text("Complete your file".tr(),style: TextStyle(fontSize: 14.sp ,fontWeight: FontWeight.w500,
                    fontFamily: "Montserrat",
                    color: Color(0xFFB93439),)),
                  SizedBox(height: 25.h,),
                ])
          ]
      ),
    );
  }
}
