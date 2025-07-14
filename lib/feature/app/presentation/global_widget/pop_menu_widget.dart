
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class PopMenuWidget extends StatelessWidget {
   PopMenuWidget({super.key,required this.onChanged,this.isOrderCancel=false});
  ValueChanged<int> onChanged;
  bool? isOrderCancel;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
                color: Colors.white,
                 iconColor: Colors.black,
                   iconSize: 60,
               surfaceTintColor: Colors.black,
                 shadowColor: Colors.black,
                     itemBuilder: (context) => [
                           PopupMenuItem(
                          value: 1,
                             child: Row(
                             children: <Widget>[
                           Icon(Icons.edit, color: context.colorScheme.primary, size: 30.w),
                                10.horizontalSpace,
                                  Text('Edit'.tr(),style: TextStyle(color: Colors.black,fontSize: 30.sp),),
                                   ],
                                ),
                      ),
                            PopupMenuItem(
                          value: 2,
                               child: Row(
                            children: <Widget>[
                               Icon(Icons.delete, color: context.colorScheme.error),
                               10.horizontalSpace,
                                AppText(isOrderCancel!?'Cancel'.tr():'Delete'.tr(),style: TextStyle(color: Colors.black,fontSize: 30.sp),),
                            ],
                               ),
                                ),

],
onSelected: onChanged,
              child: Icon(Icons.more_vert, color: context.colorScheme.primary,size: 45.r,),
);
  }
}
