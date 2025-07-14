import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../auth/presentation/pages/login_page.dart';

// class LocationPermissionPage extends StatelessWidget {
//   const LocationPermissionPage({super.key});
//
//   Future<void> _handleLocationPermission(BuildContext context) async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return;
//     }
//
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return;
//     }
//
//     // Navigate to next screen after permission granted
//     if (permission == LocationPermission.always ||
//         permission == LocationPermission.whileInUse) {
//       Navigator.pushReplacementNamed(context, '/home');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF3EFEF),
//       body: SafeArea(
//         child: Column(
//           children: [
//             SizedBox(height: 20.h),
//             Image.asset(
//               'assets/images/app_logo.png',
//               width: 80.w,
//               height: 80.w,
//             ),
//           50.verticalSpace,
//             AppImage.asset(
//               'assets/images/Group 6.svg',
//               height: 250.h,
//               fit: BoxFit.fill,
//             ),
//             SizedBox(height: 40.h),
//             Text(
//               'Get My Location'.tr(),
//               style: TextStyle(
//                 fontSize: 24.sp,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[700],
//               ),
//             ),
//             SizedBox(height: 16.h),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Text(
//                 'We will use the location of the device near you to search for a nurse when you request the service.'.tr(),
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 24.w),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context,MaterialPageRoute(builder:(context) =>  LoginPage()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.grey[400],
//                         padding: EdgeInsets.symmetric(vertical: 16.h),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                         ),
//                       ),
//                       child: Text(
//                         'Not NOW'.tr(),
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 16.w),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => _handleLocationPermission(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: context.colorScheme.primary,
//                         padding: EdgeInsets.symmetric(vertical: 16.h),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.r),
//                         ),
//                       ),
//                       child: Text(
//                         'Locate'.tr(),
//                         style: TextStyle(
//                           fontSize: 16.sp,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 40.h),
//           ],
//         ),
//       ),
//     );
//   }
// }

class LocationPermissionPage extends StatelessWidget {
  const LocationPermissionPage({super.key});

  Future<void> _handleLocationPermission(BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    // 1. التحقق من تمكين خدمة الموقع (GPS)
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enable location services from your device settings.')),
      );
      return;
    }

    // 2. التحقق من صلاحية الموقع الحالية
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location permission was denied. Please grant it from app settings.')),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is permanently denied. Please enable it from app settings.')),
      );
      return;
    }

    // 3. إذا تم منح الصلاحية (دائمًا أو أثناء الاستخدام)
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      try {
        // احصل على الموقع الحالي للمستخدم
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
          timeLimit: const Duration(seconds: 10),
        );

        // بناء الـ URI لفتح الخريطة على الموقع الحالي فقط
        // صيغة 'geo:latitude,longitude' لفتح تطبيق الخرائط الافتراضي بدون ماركر
        final Uri mapUri = Uri.parse('geo:${position.latitude},${position.longitude}');

        // محاولة إطلاق الـ URI
        if (await canLaunchUrl(mapUri)) {
          await launchUrl(mapUri);
          print('Map launched successfully with location: ${position.latitude}, ${position.longitude}');
        } else {
          // إذا فشلت الطريقة الأولى (مثلاً لا يوجد تطبيق خرائط يدعم geo:)، حاول فتح جوجل ماب في المتصفح
          print('Could not launch device map. Trying Google Maps in browser...');
          final Uri googleMapsUrl = Uri.parse('https://maps.google.com/?q=${position.latitude},${position.longitude}');
          if (await canLaunchUrl(googleMapsUrl)) {
            await launchUrl(googleMapsUrl);
            print('Google Maps launched in browser.');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not open map. Please check your map applications or internet connection.')),
            );
          }
        }

        // بعد محاولة فتح الخريطة، يمكنك اختيار الانتقال إلى الشاشة الرئيسية
        // Navigator.pushReplacementNamed(context, '/home');

      } catch (e) {
        print('Error getting location or launching map: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to get location or open map: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Image.asset(
              'assets/images/app_logo.png',
              width: 80.w,
              height: 80.w,
            ),
          50.verticalSpace,
            AppImage.asset(
              'assets/images/Group 6.svg',
              height: 250.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 40.h),
            Text(
              'Get My Location'.tr(),
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Text(
                'We will use the location of the device near you to search for a nurse when you request the service.'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Not NOW'.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _handleLocationPermission(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        'Locate'.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
