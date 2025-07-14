
import 'package:beiti_care/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'otp_verification_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();

  void _handleSendOTP() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(VerifyEvent(param: _phoneController.text, onSuccess: () {
        Navigator.push(context,MaterialPageRoute(builder:(context) =>  OtpVerificationScreen(phoneNumber: '00',)));

      },));

    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                
                  SizedBox(height: 30.h),
                  _buildIllustration(),
                  SizedBox(height: 30.h),
                  _buildTitle(),
                  SizedBox(height: 10.h),
                  _buildSubtitle(),
                  SizedBox(height: 30.h),
                  _buildPhoneInput(),
                  SizedBox(height: 20.h),
                  _buildSendOTPButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _buildIllustration() {
    return Image.asset(
   'assets/images/Group 4.png',
      height: 200.h,
    );
  }

  Widget _buildTitle() {
    return Text(
      'Forget Password'.tr(),
      style: TextStyle(
        fontSize: 25.sp,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF49768C),
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      'Please enter your mobile to send you a verification code'.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Color(0xFF8B8B8B),
        height: 1.5,
      ),
    );
  }

  Widget _buildPhoneInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone Number'.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B8B8B),
          ),
        ),
        SizedBox(height: 8.h),

        SizedBox(
          height: 80,
          child: IntlPhoneField(
            pickerDialogStyle: PickerDialogStyle(
                countryNameStyle: TextStyle(color: Colors.black),
                countryCodeStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
            ),
            dropdownTextStyle: TextStyle(
                color: Colors.black
            ),
            dropdownDecoration: BoxDecoration(

            ),
            style: TextStyle(
                color: Colors.black
            ),
            decoration: InputDecoration(
              labelText: 'Phone Number'.tr(),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            initialCountryCode: 'EG',
            onChanged: (phone) {
              print('rrrrrrrrrrrrrrrrrrr${phone.countryISOCode}');
              print(phone.completeNumber);
              _phoneController.text=phone.completeNumber;
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSendOTPButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSendOTP,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB82C2C),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Send OTP'.tr(),
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
