import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    this.title,
    this.action,
    this.elevation,
    this.shadowColor,
    this.surfaceTintColor,
    this.name,
    this.leading,
    this.toolbarHeight,
    this.context,
    this.keyScaffold,
  });

  final String? title;
  final String? name;
  final List<Widget>? action;
  final double? elevation;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final Widget? leading;
  final double? toolbarHeight;
  BuildContext? context;
  GlobalKey<ScaffoldState>? keyScaffold;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade400,
          offset: const Offset(0, 3.0),
          blurRadius: 6.0,
        )
      ]),
      child: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: toolbarHeight ?? 79.h,
        title: Padding(
          padding: REdgeInsetsDirectional.only(top: 15),
          child: AppText(title ?? '',
              style: context.textTheme.headlineLarge!
                  .copyWith(color: Colors.black.withOpacity(.7))),
        ),
        leading: InkWell(
          onTap: () {
          },
          child: Padding(
            padding: REdgeInsetsDirectional.only(end: 10),
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 35.r,
            ),
          ),
        ),
        actions: action,
        // actions: [
        //
        //   InkWell(
        //     onTap: (){
        //       context.pop();
        //     },
        //     child: Padding(
        //       padding: REdgeInsetsDirectional.only(end: 10),
        //       child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,size: 35.r,),
        //     ),
        //   )
        // ]  ,
        centerTitle: true,
        shadowColor: shadowColor,
        surfaceTintColor: surfaceTintColor,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
