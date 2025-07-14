// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//
//   const CustomAppBar({
//     super.key,
//     required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 0,
//       leading: IconButton(
//         icon: Icon(
//           Icons.arrow_back_ios,
//           size: 20.w,
//           color: Colors.black,
//         ),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 18.sp,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       actions: [
//         IconButton(
//           icon: Icon(
//             Icons.notifications,
//             size: 24.w,
//             color: Theme.of(context).primaryColor,
//           ),
//           onPressed: () {
//             // TODO: Handle notification tap
//           },
//         ),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(56.h);
// }