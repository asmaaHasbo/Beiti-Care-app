import 'package:beiti_care/view/cubit/asmaa_profile_cubit.dart';
import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatefulWidget {
  final String title;
  final String label;
  TextEditingController? controller;
  CustomTextField(
      {this.controller, super.key, required this.title, required this.label});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

Country? selectedCountry;

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AsmaaProfileCubit, AsmaaProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccessState) {
          if (widget.title == "Full Name".tr()) {
              print(state.userProfileModel.password);
            widget.controller?.text = state.userProfileModel.userName ?? '';
          } else if (widget.title == "Password".tr()) {
            print(state.userProfileModel.password);
            // widget.controller?.text = state.userProfileModel.password ?? '';
          } else if (widget.title == "Confirm Password".tr()) {
            // widget.controller?.text = state.userProfileModel.password ?? '';
          } else if (widget.title == "Email".tr()) {
            widget.controller?.text = state.userProfileModel.email ?? '';
          }
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            widget.title,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF8B8B8B),

            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            width: 400.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
              // border: Border.all(color: Color(0xFF8B8B8B), width: 1)
            ),
            child: TextFormField(
              controller: widget.controller,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                contentPadding:  EdgeInsets.all(10.w),
                border: InputBorder.none,
                labelText: widget.label,
                labelStyle: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8B8B8B),
                  overflow: TextOverflow.clip,
                ),
                prefixIcon: widget.title == "Phone Number".tr()
                    ?
                SizedBox(
                  height: 80.h,
                  child: IntlPhoneField(
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
                      fillColor: Colors.white,
                      filled: true,
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
                ):
                // InkWell(
                //   onTap: () {
                //     showCountryPicker(
                //       context: context,
                //       showPhoneCode: true,
                //       favorite: ['SA', 'EG'],
                //       onSelect: (Country country) {
                //       },
                //     );
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 5.0),
                //     child: Row(
                //       children: [
                //         Text(
                //           '+${selectedCountry!.phoneCode} ${selectedCountry!.flagEmoji}'
                //           ,
                //           style: TextStyle(fontSize: 14,fontFamily: "Montserrat",fontWeight: FontWeight.w500,color: Color(0xFF8B8B8B)),
                //         ),
                //         const SizedBox(
                //           width: 3,
                //         ),
                //
                //         Container(height: 18,width: 0.2,
                //           color: Color(0xFF8B8B8B),
                //         )
                //       ],
                //     ),
                //   ),
                // ):
                null,
              ),
            ),
          )
        ]);
      },
    );
  }
}
