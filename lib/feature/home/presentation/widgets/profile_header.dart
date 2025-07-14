import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/feature/notifications/presentation/screens/notifications_screen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../profile/data/model/user_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key,required this.data});
final UserModel data;
  @override
  Widget build(BuildContext context) {
     getIt<PreferencesRepository>().setString('userName', data.data.userName);
      getIt<PreferencesRepository>().setString('phone', data.data.phone);

    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          // Profile Image

          CircleAvatar(
            radius: 25.r,
            child:    ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: FancyShimmerImage(
                imageUrl:data.data.image,
              ),
            ),
          ),

          SizedBox(width: 12.w),
          
          // Name and Location
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                 data.data.userName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16.w, color: Color(0xFF5E5C5C)),
                    SizedBox(width: 4.w),
                    Text(
                   data.data.location,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF5E5C5C),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Notification Icon
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Theme.of(context).primaryColor,
              size: 24.w,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationsScreen(),));

              // TODO: Handle notification tap
            },
          ),
        ],
      ),
    );
  }
} 