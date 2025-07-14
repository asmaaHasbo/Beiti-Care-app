import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/language_service.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
bool isSelectedAr=false;

bool isSelectedEn=true;
@override
  void initState() {
   if(LanguageService.languageCode=='ar'){
      isSelectedAr=true;

      isSelectedEn=false;
   }else{
      isSelectedAr=false;

      isSelectedEn=true;
   }
    super.initState();
  }
  @override
  Widget build(BuildContext context, ) {

    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'Language'.tr()),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildLanguageOption(
              context: context,
// <<<<<<< HEAD
              title: 'Arabic'.tr(),
              isSelected: false,
              onChanged:
              (value){
                EasyLocalization.of(context)?.setLocale(const Locale('ar'));

              }
              //     (value) {
              //   if (value) {
              //   }
              // },
// =======
//               title: 'Arabic'.tr(),
//               isSelected: isSelectedAr,
//               onChanged: (value) {
//                setState(() {
//                  setState(() {
//                    isSelectedAr=!isSelectedAr;
//                    isSelectedEn=!isSelectedEn;
//                  });
//                });
//               },
// >>>>>>> batoul_new
            ),
            SizedBox(height: 16.h),
            _buildLanguageOption(
              context: context,
// <<<<<<< HEAD
              title: 'English'.tr(),
              isSelected: true,
              onChanged:
              (value){
                EasyLocalization.of(context)?.setLocale(const Locale('en'));

              }
              //     (value) {
              //   if (value) {
              //   }
              // },
// =======
//               title: 'English'.tr(),
//               isSelected: isSelectedEn,
//               onChanged: (value) {
//                 setState(() {
//                   setState(() {
//                     isSelectedAr=!isSelectedAr;
//                     isSelectedEn=!isSelectedEn;
//                   });
//                 });
//               },
// >>>>>>> batoul_new
            ),
            const Spacer(),
            _buildSaveButton(context),
            SizedBox(height: 16.h),
            _buildCancelButton(context),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required String title,
    required bool isSelected,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                color: const Color(0xFFB94A48),
                fontWeight: FontWeight.w500,
              ),
            ),
            Switch(
              value: isSelected,
              onChanged: onChanged,
              activeColor: const Color(0xFFB94A48),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {

           await context.setLocale(supportedLocal[ isSelectedAr?1:0]) ;       },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFB94A48),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Save'.tr(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2D3142),
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          'Cancel'.tr(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
