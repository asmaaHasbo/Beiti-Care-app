import 'package:beiti_care/feature/auth/presentation/pages/login_page.dart';
import 'package:beiti_care/view/screens/welcome_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/otp_input_field.dart';
import 'dart:async';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  Timer? _timer;
  int _remainingTime = 150; // 2:30 minutes in seconds
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingTime == 0) {
        setState(() {
          _canResend = true;
          timer.cancel();
        });
      } else {
        setState(() {
          _remainingTime--;
        });
      }
    });
  }

  void _handleResend() {
    if (_canResend) {
      setState(() {
        _remainingTime = 150;
        _canResend = false;
        _otpController.clear();
      });
      _startTimer();
      // TODO: Implement resend OTP logic
    }
  }

  void _handleSubmit() {

    Navigator.push(context,MaterialPageRoute(builder:(context) =>  LoginPage()));

    if (_otpController.text.length == 6) {
      // TODO: Implement OTP verification logic
    }
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              children: [
                _buildHeader(),
                _buildInstructions(),
                _buildTimer(),
                SizedBox(height: 24.h),
                OtpInputField(
                  controller: _otpController,
                  onCompleted: (_) => _handleSubmit(),
                ),
                SizedBox(height: 16.h),
                _buildResendButton(),
                SizedBox(height: 24.h),
                _buildSubmitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Image.asset(
          'assets/images/Group 4.png',
          height: 330.h,
        ),
        Text(
          'OTP Verification'.tr(),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF49768C),
          ),
        ),
      ],
    );
  }

  Widget _buildInstructions() {
    return Column(
      children: [
        SizedBox(height: 12.h),
        Text(
          'Please enter the code sent to your mobile'.tr(),
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
        Text(
          'number ${widget.phoneNumber}',
          style: TextStyle(
            fontSize: 14.sp,
            color: Color(0xFF49768C),
          ),
        ),
      ],
    );
  }

  Widget _buildTimer() {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Text(
        _formatTime(_remainingTime),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF4A4A4A),
        ),
      ),
    );
  }

  Widget _buildResendButton() {
    return GestureDetector(
      onTap: _handleResend,
      child: Text(
        'I didn\'t receive any code • RESEND'.tr(),
        style: TextStyle(
          fontSize: 14.sp,
          color: _canResend ? const Color(0xFFB82C2C) : Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSubmit,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB82C2C),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Submit'.tr(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
