import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PhoneField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        height: 80,
        child: IntlPhoneField(
          controller: controller,
          pickerDialogStyle: PickerDialogStyle(
              countryNameStyle: TextStyle(color: Colors.black),
              countryCodeStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
          ),
          dropdownTextStyle: TextStyle(
              color: Colors.black
          ),
          dropdownDecoration: BoxDecoration(

          ),
          style: TextStyle(
              color: Colors.black
          ),
          autovalidateMode: AutovalidateMode.disabled,
          decoration: InputDecoration(
            // fillColor: Colors.white,
            // filled: true,
            labelText: 'Phone Number'.tr(),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),

          initialCountryCode: 'EG',
          onChanged: (phone) {
            print('rrrrrrrrrrrrrrrrrrr${phone.countryISOCode}');
            print(phone.completeNumber);
            // _nursePhoneController.text=phone.completeNumber;
          },
        ),
      );
    //   TextFormField(
    //   controller: controller,
    //   style: TextStyle(color: Colors.black,fontSize: 14.sp, fontWeight: FontWeight.w500,
    //   ),
    //   keyboardType: TextInputType.phone,
    //   validator: validator,
    //   decoration: InputDecoration(
    //     hintText: 'Phone Number',
    //     hintStyle: TextStyle(color: Color(0xFF8B8B8B), ),
    //     prefixIcon: Container(
    //       padding: EdgeInsets.symmetric(horizontal: 8.w),
    //       child: Row(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //
    //           SizedBox(width: 4.w),
    //           Text(
    //             '+20',
    //             style: TextStyle(fontSize: 14.sp,color: Color(0xFF8B8B8B), fontWeight: FontWeight.w500),
    //           ),
    //           SizedBox(width: 4.w),
    //           Container(
    //             height: 24.h,
    //             width: 1.w,
    //             color: Color(0xFFF3EFEF),
    //           ),
    //         ],
    //       ),
    //     ),
    //     filled: true,
    //     fillColor: Color(0xFFF3EFEF),
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(8.r),
    //       borderSide: BorderSide(color: Color(0xFF8B8B8B)!),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(8.r),
    //       borderSide: BorderSide(color: Color(0xFF8B8B8B)!),
    //     ),
    //     // focusedBorder: OutlineInputBorder(
    //     //   borderRadius: BorderRadius.circular(8.r),
    //     //   borderSide: const BorderSide(color: Color(0xFFB82C2C)),
    //     // ),
    //   ),
    // );
  }
}
