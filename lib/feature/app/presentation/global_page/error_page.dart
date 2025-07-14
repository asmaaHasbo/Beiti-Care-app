import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorPage extends StatelessWidget {
  final VoidCallback onPressed;
  const ErrorPage({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed:onPressed,
        icon:  Icon(Icons.refresh,size: 50.r,),
      ),
    );
  }
}
