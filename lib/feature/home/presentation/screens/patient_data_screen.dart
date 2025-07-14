import 'package:beiti_care/common/helpers/add_paitent_data.dart';
import 'package:beiti_care/core/utils/extensions/build_context.dart';
import 'package:beiti_care/feature/more/presentation/screens/all_patients_details.dart';
import 'package:beiti_care/feature/requests/presentation/widgets/custom_app_bar.dart';
import 'package:beiti_care/view/asmaa_api/api_consumer.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/cubit/clint_id_cubit.dart';
import 'package:beiti_care/view/screens/cubit/compelete_profile_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PatientDataScreen extends StatefulWidget {
  String? id ; 
   PatientDataScreen({ Key? key , this.id}) : super(key: key);

  @override
  _PatientDataScreenState createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  // Text controllers
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _nurseNameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // Media controllers
  File? _recordVideoPhoto;
  File? _tubePicture;
  String? _selectedDate;
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _codeController.dispose();
    _nurseNameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source, bool isRecordVideoPhoto) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          if (isRecordVideoPhoto) {
            _recordVideoPhoto = File(pickedFile.path);
          } else {
            _tubePicture = File(pickedFile.path);
          }
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        _selectedDate =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: CustomAppBar(title: 'patient_data'.tr()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('code'.tr()),
            _buildTextField(_codeController, 'code_hint'.tr()),
            SizedBox(height: 20.h),

            _buildLabel('record_video_photo'.tr()),
            _buildMediaField(
              _recordVideoPhoto?.path ?? 'record_video_photo_hint'.tr(),
              true,
            ),
            // SizedBox(height: 20.h),
            //
            // _buildLabel('tube_picture'.tr()),
            // _buildMediaField(
            //   _tubePicture?.path ?? 'tube_picture_hint'.tr(),
            //   false,
            // ),
            SizedBox(height: 20.h),

            Text(
              'record_withdrawal'.tr(),
              style: TextStyle(
                color: context.colorScheme.primary,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),

            _buildLabel('nurse_name'.tr()),
            _buildTextField(_nurseNameController, 'nurse_name_hint'.tr()),
            SizedBox(height: 20.h),

            _buildLabel('location'.tr()),
            _buildTextField(_locationController, 'location_hint'.tr()),
            SizedBox(height: 20.h),

            _buildLabel('date'.tr()),
            _buildDateField(context),
            SizedBox(height: 32.h),

            _buildSendButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black54,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }

  Widget _buildMediaField(String text, bool isRecordVideoPhoto) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                text,
                style: TextStyle(
                  color: text == 'record_video_photo_hint'.tr() ||
                          text == 'tube_picture_hint'.tr()
                      ? Colors.grey
                      : Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
            onPressed: () => _showImageSourceDialog(isRecordVideoPhoto),
          ),
        ],
      ),
    );
  }

  void _showImageSourceDialog(bool isRecordVideoPhoto) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('select_source'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera, isRecordVideoPhoto);
            },
            child: Text('camera'.tr()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery, isRecordVideoPhoto);
            },
            child: Text('gallery'.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Text(
                  _selectedDate ?? 'select_date'.tr(),
                  style: TextStyle(
                    color: _selectedDate == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.calendar_today, color: Colors.grey),
              onPressed: () => _selectDate(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSendButton(context) {
    return SizedBox(
      width: double.infinity,
// <<<<<<< HEAD
      child: isLoading
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });
                AddPatentData.addPaitentData(
                    widget.id!,
                    _nurseNameController.text,
                    _codeController.text,
                    _selectedDate ?? '',
                    context,
                    _recordVideoPhoto);

                setState(() {
                  isLoading = false;
                });
//68497193e6e2d78bacfc15a8
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  BlocProvider(
                              create: (context) => CompeleteProfileCubit(
                                  NadaDioConsumer(dio: Dio())),
                              child: AllPatientsDetails(id:  widget.id),
                            )));
                // Here you can send the data to your API
                // Show success message

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFb93439),
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Next'.tr(),
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }
}
