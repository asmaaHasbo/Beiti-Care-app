import 'package:beiti_care/feature/requests/presentation/bloc/request_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/screens/tracking.dart';
import '../screens/session_completed.dart';

class RequestCard extends StatelessWidget {
  final String name;
  final String location;
  final String service;
  final String time;
  final String? code;
final String? id;
  const RequestCard({
    super.key,
    required this.name,
    required this.location,
    required this.service,
    required this.time,
    this.code,
    required this.id
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF3EFEF),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xff8B8B8B), width: .6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 25.r,

                ),
                SizedBox(width: 12.w),

                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            time,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Text(
                            location,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFB82C2C) ,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        service,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Color(0xFF49768C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Action Buttons
          // Action Buttons
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _ActionButton(
                    text: 'Cancel'.tr(),
                    backgroundColor: Colors.black,
                    onPressed: () {
                      context.read<RequestBloc>().add(CancelSessionEvent(id: id??'',onSuccess: () {
                        context.read<RequestBloc>().add(RequestClientEvent());
                      }));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: _ActionButton(
                    text: 'Accept'.tr(),
                    backgroundColor: const Color(0xFFB93439),
                    onPressed: () {
                      context.read<RequestBloc>().add(AcceptSessionEvent(id: id??'',onSuccess: () {
                        context.read<RequestBloc>().add(RequestClientEvent());
                        Navigator.push(context, MaterialPageRoute(

                            // builder: (context) => SessionCompleted()

                            builder: (context) => TrackingPage(id: id??"",)
                        ));
                      },));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.text,
    required this.backgroundColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 100.w,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
             Radius.circular( 12.r),

            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
