import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderSelectionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderSelectionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xFFB82C2C) : Colors.grey[300]!,
          ),
          borderRadius: BorderRadius.circular(8.r),
          color: isSelected
              ? const Color(0xFFB82C2C).withOpacity(0.1)
              : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFFB82C2C) : Color(0xFF8B8B8B),
              size: 25.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                fontSize: 15.sp,
                color: isSelected ? const Color(0xFFB82C2C) : Color(0xFF8B8B8B),
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
