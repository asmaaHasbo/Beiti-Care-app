import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../view/widgets/app_bar_widget.dart';

class WalletPayScreen extends StatefulWidget {
  const WalletPayScreen({super.key});

  @override
  State<WalletPayScreen> createState() => _WalletPayScreenState();
}

class _WalletPayScreenState extends State<WalletPayScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _amountController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _amountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Wallet".tr()),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildWalletHeader(),
                SizedBox(height: 32.h),
                _buildInputLabel('Cash Phone Number'.tr()),
                SizedBox(height: 8.h),
                _buildPhoneInput(),
                SizedBox(height: 24.h),
                _buildInputLabel('Enter the amount'.tr()),
                SizedBox(height: 8.h),
                _buildAmountInput(),
                SizedBox(height: 24.h),
                _buildInputLabel('Password'.tr()),
                SizedBox(height: 8.h),
                _buildPasswordInput(),
                SizedBox(height: 32.h),
                _buildSendButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color:Color(0xff49768C)),

        
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/app_logo.png',
            width: 80.w,
            height: 80.w,
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.amber,
                size: 24.w,
              ),
              SizedBox(width: 8.w),
              Text(
                '0.00',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.grey[600],
      ),
    );
  }

  Widget _buildPhoneInput() {
    return SizedBox(
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
        autovalidateMode: AutovalidateMode.disabled,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: 'Phone Number'.tr(),
          border: OutlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),

        initialCountryCode: 'EG',
        onChanged: (phone) {
          print('rrrrrrrrrrrrrrrrrrr${phone.countryISOCode}');
          print(phone.completeNumber);
          // _nursePhoneController.text=phone.completeNumber;
        },
      ),
    );

  }

  Widget _buildAmountInput() {
    return TextFormField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Enter the amount'.tr(),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xFF5C6B8E),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter an amount'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password'.tr(),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(
            color: Color(0xFF5C6B8E),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password'.tr();
        }
        return null;
      },
    );
  }

  Widget _buildSendButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _handleSend,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF49768C),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Send'.tr(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _handleSend() {
    if (_formKey.currentState!.validate()) {
      // TODO: Implement payment logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Processing payment...'),
        ),
      );
    }
  }
}