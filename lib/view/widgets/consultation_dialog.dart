import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConsultationDialog extends StatefulWidget {
  const ConsultationDialog({super.key});

  @override
  State<ConsultationDialog> createState() => _ConsultationDialogState();
}

class _ConsultationDialogState extends State<ConsultationDialog> {
  bool _isChecked1 = false; // Initial value of the checkbox
  bool _isChecked2 = false; // Initial value of the checkbox

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: 274.w,
            height: 413.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Padding(
                padding:  EdgeInsets.all(20.0.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/app_logo.png',
                        height: 96.h,
                        width: 100.w,
                      ),
                      Text(
                        "Do you want to request a consultation?".tr(),
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF49768C),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked1,
                            onChanged: (bool? newValue) {
                              // The parameter is nullable
                              if (newValue != null) {
                                // Null check
                                setState(() {
                                  _isChecked1 = newValue;
                                });
                              }
                            },
                            activeColor: Colors.transparent, // Color when the checkbox is checked
                            checkColor: Color(0xFF8B8B8B), // Color of the checkmark
                            // focusColor: Colors.blue,
                            // hoverColor: Colors.lightBlue,
                          ),
                           Text('Doctor'.tr(),
                              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color:Color(0xFF8B8B8B) )),

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isChecked2,
                            onChanged: (bool? newValue) {
                              // The parameter is nullable
                              if (newValue != null) {
                                // Null check
                                setState(() {
                                  _isChecked2 = newValue;
                                });
                              }
                            },
                            activeColor: Colors.transparent, // Color when the checkbox is checked
                            checkColor: Color(0xFF8B8B8B), // Color of the checkmark
                            // focusColor: Colors.blue,
                            // hoverColor: Colors.lightBlue,
                          ),
                           Text('Nurse'.tr(),
                              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color:Color(0xFF8B8B8B) )),

                        ],
                      ),

                      SizedBox(
                        height: 30.h,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context, MaterialPageRoute(builder: (context) => EditPasswordScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize:  Size(163.w, 50.h),
                              padding: null,
                              backgroundColor: Color(0xFF49768C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Text(
                            "WhatsApp".tr(),
                            style:  TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      SizedBox(
                        height: 30.h,
                      ),
                    ]))));
  }
}
