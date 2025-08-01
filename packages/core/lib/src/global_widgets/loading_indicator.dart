import 'dart:io';
import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.color,
    this.dimension,
  });

  final Color? color;
  final double? dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension ?? 16.r,
      child: Platform.isAndroid
          ? CircularProgressIndicator(
              backgroundColor: color ?? context.theme.colorScheme.primary.withOpacity(0.6),
              strokeWidth: 1.8,
              valueColor: AlwaysStoppedAnimation<Color>(color != null ? context.colorScheme.primary : Colors.white70),
            )
          : CupertinoActivityIndicator(color: color ?? context.colorScheme.primary.withOpacity(0.6)),
    );
  }
}
