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
//         icon: Row(
//           children: [
//             Icon(
//               Icons.arrow_back_ios,
//               size: 20.w,
//               color: Theme.of(context).primaryColor,
//             ),
//             Text(
//               title,
//               style: TextStyle(
//                 color: Theme.of(context).primaryColor,
//                 fontSize: 12.sp,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//         onPressed: () => Navigator.of(context).pop(),
//       ),
//       leadingWidth: 120.w,
//       title: const Text(''),
//     );
//   }
//
//   @override
//   Size get preferredSize => Size.fromHeight(56.h);
// }
