import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF3EFEF),
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Image.asset(
          "assets/images/back_button.png",
          width: 24,
          height: 24,
        ),
      ),

      title: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFB93439), )

    ),
      // centerTitle: false,

    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
