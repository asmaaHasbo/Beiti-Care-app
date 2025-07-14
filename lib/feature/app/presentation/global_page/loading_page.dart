import 'package:beiti_care/core/utils/extensions/build_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child:  LoadingAnimationWidget.staggeredDotsWave(
        color:context.colorScheme.primary,
        size: 40.r,
      ),
    );
  }
}
