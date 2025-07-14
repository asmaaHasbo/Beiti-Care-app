import 'dart:io';

import 'package:beiti_care/feature/profile/data/model/user_model.dart';
import 'package:beiti_care/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/models/page_state/result_builder.dart';
import '../../../../core/di/di_container.dart';
import '../../../../services/add_image_to_profile_cubit.dart';
import '../../../app/domain/repo/preferences_repository.dart';
import '../../../app/presentation/global_page/empty_page.dart';
import '../../../app/presentation/global_page/error_page.dart';
import '../../../app/presentation/global_page/loading_page.dart';
import '../../../auth/domain/use_case/register_nurse_use_case.dart';
import '../../../home/presentation/widgets/bottom_nav_bar.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';
import '../widgets/profile_form.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  late AddImageToProfileCubit addImageToProfileCubit;

  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    addImageToProfileCubit = BlocProvider.of<AddImageToProfileCubit>(
        context);
    _loadUserId();

    super.initState();
  }


  String? userId;

  Future<void> _loadUserId() async {
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('idUser');
    setState(() {}); // إعادة بناء الويدجت بعد جلب الـ ID
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return PageStateBuilder(
          init: Container(),
          success: (data) =>
              Scaffold(
            backgroundColor: Color(0xFFF3EFEF),
          bottomNavigationBar: CustomBottomNavBar(currentIndex: 2,),
          appBar:  CustomAppBar(title: 'Profile'.tr()),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildProfileHeader(data),
                  SizedBox(height: 24.h),
                   ProfileForm(data: data),
                ],
              ),
            ),
          ),
        ),
          empty: const EmptyPage(),
          loading:const LoadingPage(),
          error: (error) =>Padding(
            padding: REdgeInsetsDirectional.only(top: 20),
            child: ErrorPage(
              onPressed: () {
                context.read<ProfileBloc>().add(GetProfileEvent());
              },
            ),
          ),
          result: state.getProfile,
        );
      },
    );
  }

  Widget buildProfileHeader( UserModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        10.horizontalSpace,
        Stack(
          children: [
        CircleAvatar(
        radius: 30.r,
        child:    ClipRRect(
        borderRadius: BorderRadius.circular(30),


          child:

    FancyShimmerImage(
    imageUrl:data.data.image,
    ),
    ),
// <<<<<<< HEAD
        ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap:
                () async {

                  final String? userId = getIt<PreferencesRepository>().getString('idUser');

                  print("Sending ID: $userId");
                  await addImageToProfileCubit.pickImage(context, userId ?? "");
                  context.read<ProfileBloc>().add(GetProfileEvent());

                },
                child: Icon(
                  Icons.camera_alt, // Or Icons.edit
                  color: Colors.black,
                  size: 24.r,
                ),
              ),
            )
          ],
        ),
            // const CircleAvatar(
            //     radius: 35,
            //     backgroundImage: AssetImage("assets/images/profile_image.png" ) ),
            // Positioned(right: 0,bottom: 0,width: 24,height: 24,child: InkWell(
            //   onTap: () {
            //     ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
            //
            //     });
            //   },
            //   child: IconButton(
            //     color: Colors.black, onPressed: () {
            //
            //   }, icon: const Icon(Icons.camera_alt,),),
            // ),)
          // ],),
// =======
//         )
//
//           ],),
// >>>>>>> batoul_new
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             data.data.userName,
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              data.data.email,
              style: TextStyle(
                fontSize: 12.sp,
                color: Color(0xFF8B8B8B),
                  fontWeight: FontWeight.w500
              ),
            ),
          ],
        ),
      ],
    );
  }

}
