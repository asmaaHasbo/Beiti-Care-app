import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountWidget extends StatelessWidget {
  const DeleteAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Container(
          width: 333.w,
          height: 157.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
              padding:  EdgeInsets.all(20.r),
              child: Column(

                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.restore_from_trash_outlined, color: Colors.black, size: 24,),
                        // SvgPicture.asset("assets/images/delete_icon.svg",width: 24,height: 24,),
                        SizedBox(width: 10.w,),
                        Text("Are you sure you want to \ndelete the account?".tr(),style: TextStyle(fontFamily: "Montserrat",fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.black)),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Text("No".tr(),style: TextStyle(fontFamily: "Montserrat",fontSize: 16.sp,fontWeight: FontWeight.w600,color: Color(0xFF8B8B8B)),)),
                          SizedBox(width: 10.w,),
                          InkWell(
                              onTap: () {},
                              child: Text("Yes".tr(),style: TextStyle(fontFamily: "Montserrat",fontSize: 16.sp,fontWeight: FontWeight.w600,color: Color(0xFFB93439)),)),
                        ]),
                  )


                ],
              )),
        ));

  }
}