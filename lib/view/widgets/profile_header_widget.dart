// ignore_for_file: avoid_print

import 'package:beiti_care/view/cubit/asmaa_profile_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AsmaaProfileCubit, AsmaaProfileState>(
      listener: (context, state) {
        if (state is GetUserDataFailureState) {
          print(state.errorMsg);

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }

        if (state is UpdateUserProfileFailureState) {
          print(state.errorMsg);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMsg)));
        }

        if (state is UpdateUserProfileSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(content: Text('Profile updated successfully'.tr())),
          );
        }
      },
      builder: (context, state) {
        String? imageUrl;
        String? userName;
        String? email;
        int? phone;
        final cubit = context.read<AsmaaProfileCubit>();

        // دائمًا استخدام الحالة المخزنة في Cubit
        if (cubit.state is GetUserDataSuccessState) {
          final prevState = cubit.state as GetUserDataSuccessState;
          imageUrl = prevState.userProfileModel.image;
          userName = prevState.userProfileModel.userName ?? 'Unknown';
          email = prevState.userProfileModel.email ?? 'Unknown';
          phone = prevState.userProfileModel.phone;
        } else if (cubit.state is UpdateUserProfileSuccessState) {
          final prevState = cubit.state as UpdateUserProfileSuccessState;
          imageUrl = prevState.userProfileModel.image;
          userName = prevState.userProfileModel.userName ?? 'Unknown';
          email = prevState.userProfileModel.email ?? 'Unknown';
          phone = prevState.userProfileModel.phone;
        } else {
          // قيم افتراضية فقط إذا لم تكن هناك بيانات متاحة على الإطلاق
          userName = 'No Data'.tr();
          email = 'No Data'.tr();
        }

        // تحديث القيم إذا كانت الحالة ناجحة
        if (state is GetUserDataSuccessState) {
          imageUrl = state.userProfileModel.image;
          userName = state.userProfileModel.userName ?? 'Unknown';
          email = state.userProfileModel.email ?? 'Unknown';
          phone = state.userProfileModel.phone;
        } else if (state is UpdateUserProfileSuccessState) {
          imageUrl = state.userProfileModel.image;
          userName = state.userProfileModel.userName ?? 'Unknown';
          email = state.userProfileModel.email ?? 'Unknown';
          phone = state.userProfileModel.phone;
        }

        return Row(children: [
          SizedBox(
            height: 70.h,
            width: 70.w,
            child: Stack(
              children: [
                CircleAvatar(
                  key: ValueKey(
                      imageUrl), // إضافة مفتاح فريد بناءً على رابط الصورة
                  radius: 35.r,
                  backgroundImage: imageUrl != null && imageUrl.isNotEmpty
                      ? CachedNetworkImageProvider(
                          imageUrl,
                          cacheKey:
                              imageUrl, // استخدام cacheKey لتجنب التخزين المؤقت القديم
                        )
                      : const AssetImage("assets/images/no-profile_image.jpg")
                          as ImageProvider,
                ),
                Positioned(
                  right: 0.w,
                  bottom: 0.h,
                  width: 24.w,
                  height: 24.h,
                  child: InkWell(
                    onTap: () async {
                      final picker = ImagePicker();
                      final XFile? pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        String extension =
                            path.extension(pickedFile.path).toLowerCase();
                        print('Selected file extension: $extension');
                        if (!['.jpg', '.jpeg', '.png'].contains(extension)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(
                              content: Text(
                               "invalid_file_type".tr()),
                            ),
                          );
                          return;
                        }

                        final currentState =
                            context.read<AsmaaProfileCubit>().state;
                        String? emailToSend;
                        if (currentState is GetUserDataSuccessState &&
                            email != 'Unknown' &&
                            email != currentState.userProfileModel.email) {
                          emailToSend = email;
                        }

                        context.read<AsmaaProfileCubit>().updateUserProfileData(
                              userName: userName != 'Unknown' ? userName : null,
                              email: emailToSend,
                              phone: phone,
                              imageFile: pickedFile,
                            );
                      }
                    },
                    child: const Icon(
                      Icons.camera_alt, color: Colors.black,
                    ),
                    // SvgPicture.asset("assets/images/camera.svg")
                  ),
                )
              ],
            ),

          ),
        SizedBox(
            width: 10.w
          ),

          //------------------------------------------------- name and email ----------------------
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    email,
                    style:  TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8B8B8B),
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
              // نعرض CircularProgressIndicator لو فيه loading
              if (state is GetUserDataLoadingState ||
                  state is UpdateUserProfileLoadingState)
                const Positioned.fill(
                  child: Center(child: CircularProgressIndicator()),
                ),
            ],
          )
        ]);
      },
    );
  }
}
