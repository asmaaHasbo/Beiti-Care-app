import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> testItems = [
      // TestItems(),
      // TestItems(),
      // TestItems(),
    ];
    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: appBar(
          context, "History".tr(),),
        body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 26.w  , vertical: 20.h),
            child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 500.h,
                    child: ListView(
                      children: testItems,
                    ),

                  )

                ]
            )
        )
    );
  }
}