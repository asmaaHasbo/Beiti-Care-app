// ignore_for_file: avoid_print

import 'package:beiti_care/view/cubit/asmaa_profile_cubit.dart';
import 'package:beiti_care/view/screens/user_profile_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/curved_navigation_bar.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/delete_account_widget.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_status_widget.dart';
import 'edit_password_screen.dart';

class EditProfileScreen extends StatefulWidget {
   const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // تهيئة القيم عند بدء الشاشة
    final cubit = context.read<AsmaaProfileCubit>();
    if (cubit.state is GetUserDataSuccessState) {
      final state = cubit.state as GetUserDataSuccessState;
      nameController.text = state.userProfileModel.userName ?? '';
      emailController.text = state.userProfileModel.email ?? '';
      phoneController.text = state.userProfileModel.phone?.toString() ?? '';
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsmaaProfileCubit, AsmaaProfileState>(
      listener: (context, state) {
        if (state is UpdateUserProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Profile updated successfully'.tr())),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const UserProfileScreen()),
          );
        } else if (state is UpdateUserProfileFailureState) {
          print(state.errorMsg);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMsg)),
          );
        }
      },
      builder: (context, state) {
        // تهيئة البيانات
        if (state is GetUserDataSuccessState) {
          nameController.text = state.userProfileModel.userName ?? '';
          emailController.text = state.userProfileModel.email ?? '';
          phoneController.text = state.userProfileModel.phone?.toString() ?? '';
        } else if (state is UpdateUserProfileSuccessState) {
          nameController.text = state.userProfileModel.userName ?? '';
          emailController.text = state.userProfileModel.email ?? '';
          phoneController.text = state.userProfileModel.phone?.toString() ?? '';
        }

        return Scaffold(
          backgroundColor: Color(0xFFF3EFEF),
          appBar: appBar(context, "Edit Profile".tr()),
          body: BlocBuilder<AsmaaProfileCubit, AsmaaProfileState>(
            builder: (context, state) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 26.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileHeaderWidget(),
                        SizedBox(
                          height: 20.h,
                        ),

                        //----------------- 70% ----------
                        Container(
                          width: double.infinity,
                          height: 100.h,
                          decoration: BoxDecoration(
                              color: Color(0xFFE3E1E1),
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                  color: Color(0xFF49768C), width: 0.6.w)),
                          child: ProfileStatusWidget(),
                        ),
                        SizedBox(
                          height: 20.h
                        ),
                        //----------------- name - email
                        SizedBox(
                          // height: 300,
                          child: Column(
                            children: [
                              CustomTextField(
                                title: "Full Name".tr(),
                                label: "Full Name".tr(),
                                controller: nameController,
                              ),
                              SizedBox(
                                height: 5.h
                              ),
                              CustomTextField(
                                title: "Email".tr(),
                                label: "Email".tr(),
                                controller: emailController,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),

                        //---------------- phone number field -----------------
                        SizedBox(
                          height: 80.h,
                          child: IntlPhoneField(
                            controller: phoneController,
                            pickerDialogStyle: PickerDialogStyle(
                                countryNameStyle:
                                    TextStyle(color: Colors.black),
                                countryCodeStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            dropdownTextStyle: TextStyle(color: Colors.black),
                            dropdownDecoration: BoxDecoration(),
                            style: TextStyle(color: Colors.black),
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
                              phoneController.text = phone.completeNumber;
                              print('rrrrrr${phone.countryISOCode}');
                              print(phone.completeNumber);
                              // _nursePhoneController.text=phone.completeNumber;
                            },
                          ),
                        ),

                        //--------------------- change password -----------
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EditPasswordScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(390.w, 50.h),
                                padding: null,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Password".tr(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Color(0xFF49768C),
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),

                        //------------------- save btn -----------
                        ElevatedButton(
                            onPressed: () {
                              String cleanedPhone = phoneController.text
                                  .replaceAll(RegExp(r'[^\d]'), '');
                              int? phoneNumber = int.tryParse(cleanedPhone);

                              if (phoneNumber == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                      content: Text(
                                          "invalid_phone_number".tr())),
                                );
                                return;
                              }

                              String? emailToSend = emailController.text.trim();
                              String? userNameToSend =
                                  nameController.text.trim();
                              final currentState =
                                  context.read<AsmaaProfileCubit>().state;

                              if (currentState is GetUserDataSuccessState) {
                                if (emailToSend ==
                                    currentState.userProfileModel.email) {
                                  emailToSend = null;
                                }
                                if (userNameToSend ==
                                    currentState.userProfileModel.userName) {
                                  userNameToSend = null;
                                }
                                if (phoneNumber ==
                                    currentState.userProfileModel.phone) {
                                  phoneNumber = null;
                                }
                              }

                              // إرسال الطلب فقط إذا كان هناك تغييرات
                              if (userNameToSend != null ||
                                  emailToSend != null ||
                                  phoneNumber != null) {
                                context
                                    .read<AsmaaProfileCubit>()
                                    .updateUserProfileData(
                                      userName: userNameToSend,
                                      email: emailToSend,
                                      phone: phoneNumber,
                                    );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                   SnackBar(
                                      content: Text('No changes to save'.tr())),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize:  Size(390.w, 50.h),
                                padding: null,
                                backgroundColor: Color(0xFFB93439),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Save".tr(),
                              style: TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        //------------- cancel -----------
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UserProfileScreen()));
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(390.w, 50.h),
                                padding: null,
                                backgroundColor: Color(0xFF49768C),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Text(
                              "Cancel".tr(),
                              style:  TextStyle(
                                fontSize: 18.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    const DeleteAccountWidget(),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(390.w, 50.h),
                                padding: null,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.restore_from_trash_outlined,
                                    color: Color(0xFFB93439),
                                    size: 24.w,
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Text(
                                    "Delete Account".tr(),
                                    style:  TextStyle(
                                      fontSize: 18.sp,
                                      color: Color(0xFFB93439),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ]),
                ),
              );
            },
          ),
          bottomNavigationBar: CurvedNavigationBarWidget(
            currentIndex: 2,
          ),
        );
      },
    );
  }
}
