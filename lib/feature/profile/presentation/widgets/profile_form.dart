import 'dart:io';

import 'package:beiti_care/feature/profile/data/model/user_model.dart';
import 'package:beiti_care/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../auth/presentation/widgets/phone_field.dart';
import '../../../auth/presentation/widgets/section_label.dart';
import '../../domain/use_case/edit_profile_use_case.dart';
import 'form_field_label.dart';
import '../screens/change_password_screen.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({super.key,required this.data});
final UserModel data;
  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _introductionController = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  Future<void> _pickImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _introductionController.dispose();
    super.dispose();
  }
@override
  void initState() {
  _fullNameController.text=widget.data.data.userName??'';
  _emailController.text=widget.data.data.email??'';
  _phoneController.text=widget.data.data.phone??'';


  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             FormFieldLabel(text: 'Full Name'.tr()),
            _buildTextField(
              controller: _fullNameController,
              hintText: 'Full Name'.tr(),
            ),
            SizedBox(height: 16.h),
             FormFieldLabel(text: 'Email'.tr()),
            _buildTextField(
              controller: _emailController,
              hintText: 'Email'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
             FormFieldLabel(text: 'Phone Number'.tr()),
            _buildPhoneField(),
// <<<<<<< HEAD

            // const SectionLabel(text: 'Image'),
            // _buildImageUpload(),
            // SizedBox(height: 16.h),
             FormFieldLabel(text: 'Introduction'.tr()),
// =======
//              SectionLabel(text: 'Image'.tr()),
//             _buildImageUpload(),
//             SizedBox(height: 16.h),
//              FormFieldLabel(text: 'Introduction'.tr()),
// >>>>>>> batoul_new
            _buildTextField(
              controller: _introductionController,
              hintText: 'Introduction'.tr(),
              maxLines: 5,
            ),
            SizedBox(height: 16.h),
            _buildChangePasswordButton(widget.data.data),
            SizedBox(height: 15.h),
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
            SizedBox(height: 12.h),
            _buildDeleteAccountButton(),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
    int? maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyle(color: Colors.black,fontSize: 15.sp),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF8B8B8B), fontWeight: FontWeight.w500, fontSize: 14),
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
      ),
    );
  }

  Widget _buildPhoneField() {
    return PhoneField(controller: _phoneController,);
  }

  Widget _buildChangePasswordButton(UserData data) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangePasswordScreen(data: data,),
          ),
        );
      },
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        // backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_outline,
            size: 20.w,
            color: Theme.of(context).primaryColor,
          ),
          SizedBox(width: 8.w),
          Text(
            'Change Password'.tr(),
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 18.sp,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(

      onPressed: () {
        context.read<ProfileBloc>().add(EditProfileEvent(param: RegisterParam(
          email: _emailController.text,
          name: _fullNameController.text,
image: _imageFile
        ), onSuccess: () {
          context.read<ProfileBloc>().add(GetProfileEvent());
        },));
        if (_formKey.currentState!.validate()) {
          // TODO: Handle save
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(300, 40),
        backgroundColor: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        'Save'.tr(),
        style: TextStyle(
          fontSize: 18.sp,
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
        minimumSize: Size(300, 40),
        backgroundColor: const Color(0xFF1F2937),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Text(
        'Cancel'.tr(),
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: "Montserrat",
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildDeleteAccountButton() {
    return TextButton.icon(
      onPressed: () {
        _showLogoutDialog(context);
        },
      icon: Icon(
        Icons.delete_outline,
        color: Theme.of(context).primaryColor,
        size: 24.w,
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: context.colorScheme.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      label: Text(
        'Delete Account'.tr(),
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        
        content: Row(
          children: [
            Expanded(
                flex: 1,
                child: Icon(Icons.delete_outline,color: Colors.black,size: 25.r,)),
            Expanded(
              flex: 4,
              child: Text(
                'Are you sure you want to delete the account?'.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        actions: [

          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'No'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Color(0xFF8B8B8B),
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Yes'.tr(),
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildImageUpload() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'image here Or Browse Image'.tr(),
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey[400],
              ),
              onPressed: () {
                _pickImage();
              },
            ),
          ),
        ],
      ),
    );
  }

}
