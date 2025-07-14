// ignore_for_file: avoid_print

import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/data/creat_request_model.dart';
import 'package:beiti_care/view/screens/cubit/services_cubit.dart';
import 'package:beiti_care/view/screens/search_screen.dart';
import 'package:beiti_care/view/widgets/suggestions_widget.dart';
import 'package:dio/dio.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:beiti_care/view/screens/cubit/notification_cubit.dart';
import 'package:beiti_care/view/widgets/curved_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beiti_care/view/cubit/asmaa_profile_cubit.dart';

import '../widgets/services_items.dart';
import 'notification_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  final  String? id = getIt<PreferencesRepository>().getString("idUser");

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AsmaaProfileCubit, AsmaaProfileState>(
        listener: (context, state) {
      if (state is GetUserDataFailureState) {
        print('Failure State: ${state.errorMsg}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMsg)),
        );
      } else if (state is UpdateUserProfileSuccessState) {
        print('Profile updated with image: ${state.userProfileModel.image}');
      }
    }, builder: (context, state) {
      print('Current State: $state');
      String? imageUrl;
      String? userName;
      String? address;

      final cubit = context.read<AsmaaProfileCubit>();
      if (state is GetUserDataSuccessState) {
        imageUrl = state.userProfileModel.image;
        userName = state.userProfileModel.userName ?? 'No Name';
        address = state.userProfileModel.address ?? 'No Address';
      } else if (state is UpdateUserProfileSuccessState) {
        imageUrl = state.userProfileModel.image;
        userName = state.userProfileModel.userName ?? 'No Name';
        address = state.userProfileModel.address ?? 'No Address';
      } else {
        if (cubit.state is GetUserDataSuccessState) {
          final prevState = cubit.state as GetUserDataSuccessState;
          imageUrl = prevState.userProfileModel.image;
          userName = prevState.userProfileModel.userName ?? 'No Name';
          address = prevState.userProfileModel.address ?? 'No Address';
        } else if (cubit.state is UpdateUserProfileSuccessState) {
          final prevState = cubit.state as UpdateUserProfileSuccessState;
          imageUrl = prevState.userProfileModel.image;
          userName = prevState.userProfileModel.userName ?? 'No Name';
          address = prevState.userProfileModel.address ?? 'No Address';
        } else {
          userName = 'No Data'.tr();
          address = 'No Data'.tr();
        }
      }
      return Scaffold(
          backgroundColor: Color(0xFFF3EFEF),
          appBar: AppBar(
            toolbarHeight: 80.h,
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFF3EFEF),
            // titleSpacing: 0,
            title: Padding(
              padding:  EdgeInsets.only(left: 0.w, top: 20.h),
              child: SizedBox(
                // width: 280.w,
                child: Row(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: 50.w,
                        height: 50.h,
                        child: state is GetUserDataSuccessState &&
                                state.userProfileModel.image != null &&
                                state.userProfileModel.image!.isNotEmpty
                            ? CachedNetworkImage(
                                imageUrl: state.userProfileModel.image!,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  "assets/images/no-profile_image.jpg",
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Image.asset(
                                "assets/images/no-profile_image.jpg",
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),

                   SizedBox(width: 10.w),
                    //----------------------- user name and location ---------------------
                    if (state is GetUserDataLoadingState)
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userName,
                              style:
                                  TextStyle(fontSize: 20.sp, color: Colors.black)),
                          Row(children: [
                            Icon(
                              Icons.location_on,
                              size: 12.w,
                              color: Color(0xFFB93439),
                            ),
                             SizedBox(width: 3.w),

                            SizedBox(
                              width: 190.w,
                              child: Text(address,
                                  style: TextStyle(
                                      overflow: TextOverflow.clip,
                                      fontSize: 14.sp,
                                      color: Colors.grey)),
                            ),
                          ])
                        ],
                      )
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding:  EdgeInsets.only(right: 5.w),
                child: Row(
                  children: [
                    // IconButton(
                    //    onPressed: () {
                    //
                    //    },
                    //   icon: Icon(Icons.search,
                    //     size: 30.w,
                    //     color: Color(0xFFB93439),),
                    // ),
                    
                    IconButton(
                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                    create: (context) => NotificationCubit(NadaDioConsumer(dio:  Dio()))..fetchNotifications( id),
                                    child:NotificationScreen())));
                      
                      },
                      icon: Icon(
                        Icons.notifications,
                        size: 30.w,
                        color: Color(0xFFB93439),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          body: Padding(
            padding:  EdgeInsets.only(
              left: 20.w,
              right: 20.w,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize:  Size(700.w, 50.h),
                          backgroundColor: const Color(0xFF49768C),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      child: Text(
                        "Request a new examination".tr(),
                        style: TextStyle(fontSize :20.sp),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Services".tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xFFB93439),
                            fontWeight: FontWeight.w600,
                          )),
                      Text("See all".tr(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                   SizedBox(height: 18.h),
                  SizedBox(
                    width: double.infinity,
                     height: 600,
                    child: BlocBuilder<ServicesCubit, ServicesState>(
                  builder: (context, state) {
                     if(state is ServicesLoading){
                       return const Center(child: CircularProgressIndicator(),);
                     }else if(state is ServicesLoaded){
                      final services = state.services;
                       return ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                     return ServicesItems(serviceId: services[index].id, ServiceName: services[index].name ,
                       ServiceSubName: services[index].name,description: services[index].description,price:
                       services[index].price,time: services[index].duration,);
                     }
                      );
                }else if(state is ServicesError){
                  return Center(child: Text(state.errorMessage),);
                }
                return SizedBox.shrink();
                  },
                )),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBarWidget(
            currentIndex: 0,
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<RequestsCubit>().createEmergencySession(
                CreateRequest(
                  client: id!,
                  nurse: "",
                  service: "",
              ));
            },
            backgroundColor: Color(0xFFB93439),
            shape: const CircleBorder(),
            child: Image.asset(
              "assets/images/urgent.png",
              width: 30.w,
              height: 30.h,
            ),
          ));
    });
  }
}
