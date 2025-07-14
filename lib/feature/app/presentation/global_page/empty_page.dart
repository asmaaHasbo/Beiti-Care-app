import 'package:core/core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          250.verticalSpace,
          10.verticalSpace,
          AppText("No data",color: context.colorScheme.primary,),
        ],
      ),
    );
  }
}
