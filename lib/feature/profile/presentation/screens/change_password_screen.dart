import 'package:beiti_care/feature/requests/presentation/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/model/user_model.dart';
import '../../domain/use_case/edit_profile_use_case.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/form_field_label.dart';

class ChangePasswordScreen extends StatefulWidget {
  final UserData data;
  const ChangePasswordScreen({super.key, required this.data});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'Profile'.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Profile Header (reuse the existing one)
                buildProfileHeader(widget.data),
                SizedBox(height: 32.h),

                // Password Fields
                 FormFieldLabel(text: 'Password'.tr()),
                _buildPasswordField(
                  controller: _passwordController,
                  hintText: 'Password'.tr(),
                  isVisible: _isPasswordVisible,
                  onToggleVisibility: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 16.h),

                 FormFieldLabel(text: 'Confirm Password'.tr()),
                _buildPasswordField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password'.tr(),
                  isVisible: _isConfirmPasswordVisible,
                  onToggleVisibility: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 32.h),

                BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    if(state.editProfile.isLoading()) {
                      return CircularProgressIndicator();
                    }
                    return _buildSaveButton(context);
                  },
                ),
                SizedBox(height: 12.h),
                _buildCancelButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildProfileHeader( UserData data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        10.horizontalSpace,
        CircleAvatar(
          radius: 30.r,
          child:    ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FancyShimmerImage(
              imageUrl:data.image,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.userName,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              data.email,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return TextFormField(
      style: TextStyle(color: Colors.black,fontSize: 15.sp),
      controller: controller,
      obscureText: isVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password'.tr();
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        if (controller == _confirmPasswordController &&
            value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: Color(0xFFF3EFEF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide.none,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.grey[600],
            size: 24.w,
          ),
          onPressed: onToggleVisibility,
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          context.read<ProfileBloc>().add(EditProfileEvent(param: RegisterParam(
            password: _passwordController.text,

          ), onSuccess: () {
            context.read<ProfileBloc>().add(GetProfileEvent());
          },));
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        'Save'.tr(),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCancelButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF1F2937),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        'Cancel'.tr(),
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
