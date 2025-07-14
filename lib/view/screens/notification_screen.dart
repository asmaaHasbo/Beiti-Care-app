import 'package:beiti_care/view/screens/cubit/notification_cubit.dart';
import 'package:beiti_care/view/screens/cubit/notification_state.dart';
import 'package:beiti_care/view/widgets/empty_services_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(
        context,
        "Notifications".tr(),
      ),
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: Padding(
          padding:  EdgeInsets.only(bottom: 10.0.h),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              if (state is NotificationLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotificationLoaded) {
                if (state.notifications.isEmpty) {
                  return const EmptyServicesScreen(); // ✅ add `return` and make sure widget is returned
                } else {
                  return ListView.builder(
                    itemCount: state.notifications.length,
                    itemBuilder: (context, index) {
                      final notification = state.notifications[index];
                      return Container(
                        margin:  EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(
                              color:  Color(0xFF8B8B8B), width: .6.w),
                        ),
                        height: 50.h,
                        child: Row(
                          children: [
                            SizedBox(width: 5.w),
                            Image.asset(
                              'assets/images/app_logo.png',
                              width: 30.w,
                              height: 30.h,
                            ),
                             SizedBox(width: 5.w),
                            Expanded(
                              child: Text(
                                notification.message,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8B8B8B),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              }

              // Optional: handle other states like NotificationError
              return const SizedBox.shrink();
            },
          ),
        ),
      )),
    );
  }
}
