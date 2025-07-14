// import 'package:beiti_care/common/helpers/get_help.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../../app/presentation/global_page/loading_page.dart';
// import '../../../requests/presentation/widgets/custom_app_bar.dart';
//
// class HelpScreen extends StatefulWidget {
//   const HelpScreen({super.key});
//
//   @override
//   State<HelpScreen> createState() => _HelpScreenState();
// }
//
// class _HelpScreenState extends State<HelpScreen> {
//   Map<String,dynamic> data={};
//   bool isLoading=false;
//   @override
//   void initState() {
//     getHelp();
//     super.initState();
//   }
//   getHelp()async{
//     setState(() {
//       isLoading=true;
//     });
//     data=await GetHelp.about();
//     setState(() {
//       isLoading=false;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//     backgroundColor: Color(0xFFF3EFEF),
//       appBar: const CustomAppBar(title: 'Help'),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(24.w),
//           child: Column(
//             children: isLoading?[
//               Center(child: LoadingPage(),)
//             ]:[
//               _buildAppLogo(),
//               SizedBox(height: 32.h),
//               _buildIllustration(),
//               SizedBox(height: 24.h),
//               _buildServiceTitle(),
//               SizedBox(height: 32.h),
//               _buildContactInfo(),
//               SizedBox(height: 40.h),
//               _buildSocialMediaLinks(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAppLogo() {
//     return Container(
//       width: 80.w,
//       height: 80.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16.r),
//         image: const DecorationImage(
//           image: AssetImage('assets/images/c11c701e-a5f2-499b-95e6-18728cd8bde9-removebg-preview 13.png'),
//           fit: BoxFit.cover,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildIllustration() {
//     return Image.asset(
//       'assets/images/Animation - 1734963535547 1 (2).png',
//       width: 240.w,
//       height: 180.h,
//       fit: BoxFit.contain,
//     );
//   }
//
//   Widget _buildServiceTitle() {
//     return Text(
//       '24/7 integrated healthcare services',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 20.sp,
//         fontWeight: FontWeight.w600,
//         color: Colors.black87,
//       ),
//     );
//   }
//
//   Widget _buildContactInfo() {
//     return Column(
//       children: [
//         _buildContactRow(
//           title: 'Contact Us',
//           value: '${data['help']['contactUs']}',
//           onTap: () => _launchPhone(data['help']['contactUs']),
//         ),
//         SizedBox(height: 16.h),
//         _buildContactRow(
//           title: 'Location',
//           value: '${data['help']['location']}',
//           onTap: () => _launchMaps('${data['help']['location']}'),
//         ),
//         SizedBox(height: 16.h),
//         _buildContactRow(
//           title: 'Email',
//           value: '${data['help']['email']}',
//           onTap: () => _launchEmail('${data['help']['email']}'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildContactRow({
//     required String title,
//     required String value,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       child: Row(
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 16.sp,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(width: 8.w),
//           Expanded(
//             child: Text(
//               value,
//               textAlign: TextAlign.end,
//               style: TextStyle(
//                 fontSize: 16.sp,
//                 color: const Color(0xFFB94A48),
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSocialMediaLinks() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildSocialButton(
//           icon: Icons.facebook,
//           onTap: () => _launchUrl('https://facebook.com'),
//         ),
//         SizedBox(width: 24.w),
//         _buildSocialButton(
//           icon: Icons.message_rounded,
//           onTap: () => _launchUrl('https://whatsapp.com'),
//         ),
//
//         SizedBox(width: 24.w),
//         _buildSocialButton(
//           icon: Icons.camera_alt_outlined,
//           onTap: () => _launchUrl('https://instagram.com'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSocialButton({
//     required IconData icon,
//     required VoidCallback onTap,
//   }) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(24.r),
//       child: Container(
//         width: 48.w,
//         height: 48.w,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           border: Border.all(
//             color: Colors.grey[300]!,
//             width: 1,
//           ),
//         ),
//         child: Icon(
//           icon,
//           size: 24.w,
//           color: Colors.grey[600],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _launchPhone(String phoneNumber) async {
//     final Uri uri = Uri.parse('tel:$phoneNumber');
//
//   }
//
//   Future<void> _launchEmail(String email) async {
//     final Uri uri = Uri.parse('mailto:$email');
//
//   }
//
//   Future<void> _launchMaps(String address) async {
//     final Uri uri =
//         Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');
//
//   }
//
//   Future<void> _launchUrl(String url) async {
//   }
// }

import 'package:beiti_care/common/helpers/get_help.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../requests/presentation/widgets/custom_app_bar.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  Map<String,dynamic> data={};
  bool isLoading=false;
  @override
  void initState() {
    getHelp();
    super.initState();
  }
  getHelp()async{
    setState(() {
      isLoading=true;
    });
    data=await GetHelp.about();
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'Help'.tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children:
            // isLoading?
            // [
            //   Center(child: LoadingPage(),)
            // ]:
            [
              _buildAppLogo(),
              SizedBox(height: 10.h),
              _buildIllustration(),
              SizedBox(height: 24.h),
              _buildServiceTitle(),
              SizedBox(height: 32.h),
              // _buildContactInfo(),
              // SizedBox(height: 40.h),
              _buildSocialMediaLinks(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppLogo() {
    return Container(
      width: 80.w,
      height: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/app_logo_large.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Image.asset(
      'assets/images/Animation - 1734963535547 1 (2).png',
      width: 230.w,
      height: 170.h,
      fit: BoxFit.contain,
    );
  }

  Widget _buildServiceTitle() {
    return Text(
      '24/7 integrated healthcare services'.tr(),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      children: [
        _buildContactRow(
          title: 'Contact Us'.tr(),
          value: '${data['help']['contactUs']}',
          onTap: () => _launchPhone(data['help']['contactUs']),
        ),
        SizedBox(height: 16.h),
        _buildContactRow(
          title: 'Location'.tr(),
          value: '${data['help']['location']}',
          onTap: () => _launchMaps('${data['help']['location']}'),
        ),
        SizedBox(height: 16.h),
        _buildContactRow(
          title: 'Email'.tr(),
          value: '${data['help']['email']}',
          onTap: () => _launchEmail('${data['help']['email']}'),
        ),
      ],
    );
  }

  Widget _buildContactRow({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFFB94A48),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialMediaLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(
          icon: Icons.facebook,
          onTap: () => _launchUrl('https://facebook.com'),
        ),
        SizedBox(width: 24.w),
        _buildSocialButton(
          icon: Icons.message_rounded,
          onTap: () => _launchUrl('https://whatsapp.com'),
        ),

        SizedBox(width: 24.w),
        _buildSocialButton(
          icon: Icons.camera_alt_outlined,
          onTap: () => _launchUrl('https://instagram.com'),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24.r),
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1,
          ),
        ),
        child: Icon(
          icon,
          size: 24.w,
          color: Colors.grey[600],
        ),
      ),
    );
  }
  Future<void> _launchPhone(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');

  }

  Future<void> _launchEmail(String email) async {
    final Uri uri = Uri.parse('mailto:$email');

  }

  Future<void> _launchMaps(String address) async {
    final Uri uri =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$address');

  }

  Future<void> _launchUrl(String url) async {
  }
}

