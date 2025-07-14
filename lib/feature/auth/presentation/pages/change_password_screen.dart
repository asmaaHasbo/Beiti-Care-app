import 'package:beiti_care/feature/auth/domain/use_case/reset_password_use_case.dart';
import 'package:beiti_care/feature/auth/presentation/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/auth_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final List<String> _passwordRequirements = ['Numbers', 'Letters'];
  final List<bool> _requirementsMet = [false, false];

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _updatePasswordRequirements(String password) {
    setState(() {
      _requirementsMet[0] = password.contains(RegExp(r'[0-9]')); // Numbers
      _requirementsMet[1] = password.contains(RegExp(r'[a-zA-Z]')); // Letters
    });
  }

  void _handleSubmit() {
    context.read<AuthBloc>().add(ResetPasswordEvent(param: ResetPassowrdParam(otp: 'otp', phone: 'phone', newPassword: 'newPassword'), onSuccess: () {
      Navigator.push(context,MaterialPageRoute(builder:(context) =>  LoginPage()));

    },));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 32.h),
                  _buildPasswordFields(),
                  SizedBox(height: 24.h),
                  _buildPasswordRequirements(),
                  SizedBox(height: 32.h),
                  _buildResetButton(),
                ],
              ),
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
          'Change Password'.tr(),
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF49768C),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPasswordLabel('Password'.tr()),
        _buildPasswordField(
          controller: _passwordController,
          isPasswordVisible: _isPasswordVisible,
          onToggleVisibility: () {
            setState(() => _isPasswordVisible = !_isPasswordVisible);
          },
          onChanged: _updatePasswordRequirements,
        ),
        SizedBox(height: 16.h),
        _buildPasswordLabel('Confirm Password'.tr()),
        _buildPasswordField(
          controller: _confirmPasswordController,
          isPasswordVisible: _isConfirmPasswordVisible,
          onToggleVisibility: () {
            setState(
                () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible);
          },
          validator: (value) {
            if (value != _passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildPasswordLabel(String label) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isPasswordVisible,
    required VoidCallback onToggleVisibility,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      onChanged: onChanged,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password'.tr();
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
            return null;
          },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Enter your password'.tr(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Color(0xFFB82C2C)),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[600],
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }

  Widget _buildPasswordRequirements() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Password Must Contain'.tr(),
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey[600],
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 8.h),
        ..._passwordRequirements.asMap().entries.map((entry) {
          final index = entry.key;
          final requirement = entry.value;
          return Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              children: [
                Icon(
                  _requirementsMet[index]
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: _requirementsMet[index]
                      ? const Color(0xFFB82C2C)
                      : Colors.grey,
                  size: 20.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  requirement,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildResetButton() {
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
          'Reset'.tr(),
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
