// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomBottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//
//   const CustomBottomNavBar({
//     super.key,
//     required this.selectedIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 8.h),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           _buildNavItem(
//             context: context,
//             icon: Icons.home,
//             label: 'Home',
//             isSelected: selectedIndex == 0,
//             onTap: () {
//               // TODO: Navigate to home
//             },
//           ),
//           _buildNavItem(
//             context: context,
//             icon: Icons.account_balance_wallet,
//             label: 'Wallet',
//             isSelected: selectedIndex == 1,
//             onTap: () {
//               // TODO: Navigate to wallet
//             },
//           ),
//           _buildNavItem(
//             context: context,
//             icon: Icons.person,
//             label: 'Profile',
//             isSelected: selectedIndex == 2,
//             onTap: () {
//               // TODO: Navigate to profile
//             },
//           ),
//           _buildNavItem(
//             context: context,
//             icon: Icons.list_alt,
//             label: 'Requests',
//             isSelected: selectedIndex == 3,
//             onTap: () {
//               // Already on requests page
//             },
//           ),
//           _buildNavItem(
//             context: context,
//             icon: Icons.more_horiz,
//             label: 'More',
//             isSelected: selectedIndex == 4,
//             onTap: () {
//               // TODO: Navigate to more
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildNavItem({
//     required BuildContext context,
//     required IconData icon,
//     required String label,
//     required bool isSelected,
//     required VoidCallback onTap,
//   }) {
//     final color = isSelected ? Theme.of(context).primaryColor : Colors.grey;
//
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             icon,
//             color: color,
//             size: 24.w,
//           ),
//           SizedBox(height: 4.h),
//           Text(
//             label,
//             style: TextStyle(
//               color: color,
//               fontSize: 12.sp,
//               fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
