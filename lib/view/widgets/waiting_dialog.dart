import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaitingDialog extends StatefulWidget {
  const WaitingDialog({super.key});

  @override
  State<WaitingDialog> createState() => _WaitingDialogState();
}

class _WaitingDialogState extends State<WaitingDialog> with SingleTickerProviderStateMixin {
  Timer? _timer;
  int _remainingTime = 30;
  late AnimationController _controller;


  @override
  void initState() {
    super.initState();
    _startTimer();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime > 0) {
        setState(() {
          _remainingTime--;
        });
      } else {
        _timer?.cancel();
        // هنا ممكن تعملي اللي عايزاه لما الوقت يخلص
        Navigator.of(context).pop(); // مثال: إغلاق الـ dialog
      }
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Widget _buildTimer() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Text(
        _formatTime(_remainingTime),
        style:  TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4A4A4A),
        ),
      ),
    );
  }

  Widget _buildHourglass() {
    return ClipRect(
      child: Align(
        alignment: Alignment.center,
        widthFactor: 0.8.w,
        heightFactor: 0.8.h,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
            angle: _controller.value * 2 * 3.1415926535897932,
            child: child,
          ); },
          child: Image.asset(
            "assets/images/hourglass_try.png",
            height: 90.h,
            width: 90.w,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Container(
        width: 274.w,
        height: 450.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.0.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              'assets/images/app_logo.png',
              height: 96.h,
              width: 100.w,
            ),
            SizedBox(height: 15.h),

                _buildHourglass(),


            SizedBox(height: 20.h),
            SizedBox(
              width: 180.w,
              child: Text(
                "waiting_for_nurse_approval".tr(),
                style: TextStyle(
                    color: Color(0xFF8B8B8B),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
              ),
            ),
             SizedBox(height: 15.h),
            _buildTimer(),
             SizedBox(height: 15.h),
            ElevatedButton(
              onPressed: () {
                if(Navigator.canPop(context)){
                  Navigator.pop(context);
                }
               
              },
              style: ElevatedButton.styleFrom(
                fixedSize:  Size(141.w, 50.r),
                backgroundColor: Color(0xFF8B8B8B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              child: Text(
                'Done'.tr(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}


