import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/helpers/get_all_Services.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/custom_search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  Map<String,dynamic> data={};
  bool isLoading=false;
  String idSevices='';


  @override
  void initState() {
    super.initState();
    getAllServices();
  }

  getAllServices()async{
    setState(() {
      isLoading=true;
    });
    data= await GetAllServices. allServices();
    setState(() {
      isLoading=false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Search".tr()),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                // CustomSearchWidget(
                //   searchFieldName: 'Service type'.tr(),
                //   hint: 'Select the service'.tr(),
                // ),

                Text(
                  'Service type'.tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff5E5C5C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 14.h),

                DropdownButtonFormField<String>(
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    // labelText: 'Service type'.tr(),
                    hintText: 'Select the service'.tr(),
                    labelStyle: TextStyle(
                        color: Color(0xff8B8B8B),
                        fontSize: 15.sp),
                  ),
                  items: (data['services'] as List?)?.map((material) {
                    return DropdownMenuItem<String>(
                      value: material['name'],
                      child: Text(material['name'],style: TextStyle(color: Colors.black,fontSize: 15.sp),),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      int index =data['services'] .indexWhere((e)=>e['name']==newValue);
                      idSevices=data['services'][index]['_id'];
                    });
                  },
                ),


                SizedBox(height: 14.h),
                Text(
                  "Search range km".tr(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff5E5C5C),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 14.h),
                TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Color(0xff8B8B8B),
                        width: 0.6.w,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Select the distance".tr(),
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xffA7A5A5),
                    ),
                  ),
                ),
                SizedBox(height: 14.h),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h, top: 400.h),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(390.spMin, 50.spMax),
                          padding: null,
                          backgroundColor: Color(0xFFB93439),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r))),
                      child: Text(
                        "Search".tr(),
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
