import 'package:beiti_care/view/screens/user_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/profile_header_widget.dart';

class EditPasswordScreen extends StatelessWidget {
 EditPasswordScreen({super.key});
 TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Edit Password".tr()),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 26.w),
        child:
        SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProfileHeaderWidget(),

             SizedBox(
              height: 40.h,
            ),

            CustomTextField( title: "Password".tr(),label: "Password".tr(), controller:passController ),

             SizedBox(
              height: 10.h,
            ),
            CustomTextField( title: "Confirm Password".tr(),label: "Confirm Password".tr(),controller: confPassController),

            SizedBox(height: 350.h,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
                  },
                style: ElevatedButton.styleFrom(
                    minimumSize:  Size(390.w, 50.h),
                    padding: null,
                    backgroundColor: Color(0xFFB93439),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: Text(
                  "Save".tr(),
                  style:  TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(height: 10.h,),

            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
                },
                style: ElevatedButton.styleFrom(
                    minimumSize:  Size(390.w, 50.h),
                    padding: null,
                    backgroundColor: Color(0xFF49768C),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r))),
                child: Text(
                  "Cancel".tr(),
                  style:  TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )),
            SizedBox(height: 10.h,),

          ]),
        ),
      ),

    );
  }
}
