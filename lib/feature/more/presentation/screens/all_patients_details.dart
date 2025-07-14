import 'dart:io';
import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/screens/cubit/clint_id_cubit.dart';
import 'package:beiti_care/view/screens/cubit/compelete_profile_cubit.dart';
import 'package:beiti_care/view/screens/data/compelete_profile_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../view/widgets/chart_patient_widget.dart';
import '../../../../view/widgets/custom_text_field.dart';
import '../../../../view/widgets/profile_header_widget.dart';
import '../../../auth/presentation/widgets/gender_selection_button.dart';
import '../../../auth/presentation/widgets/section_label.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';

class AllPatientsDetails extends StatefulWidget {
  String? id;
   AllPatientsDetails({super.key , this.id});

  @override
  State<AllPatientsDetails> createState() => _AllPatientsDetailsState();
}

class _AllPatientsDetailsState extends State<AllPatientsDetails> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _healthNumberController = TextEditingController();
  final TextEditingController _bloodTypeController = TextEditingController();
  final TextEditingController _chronicDiseasesController = TextEditingController();
  final TextEditingController _allergyController = TextEditingController();
  final TextEditingController _medicationsCurrentlyController = TextEditingController();
  final TextEditingController _lastDateforExaminationController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _imagecontroller = TextEditingController();
  final TextEditingController _nearestPersonController = TextEditingController();
  final TextEditingController _lastHospitalAdmissionDateController = TextEditingController();
  final TextEditingController _surgeryController = TextEditingController();
  final TextEditingController _previousLaporatoryTestsAndDateController = TextEditingController();
  final TextEditingController _medicalReportsRumorsAndTestsController = TextEditingController();
  final TextEditingController _medicalDiagnosesController = TextEditingController();
  final TextEditingController _vaccinationsController = TextEditingController();
  final TextEditingController _medicationsLastMonthsController = TextEditingController();
  final TextEditingController _dosageAndRegularityController = TextEditingController();
  final TextEditingController _hereditaryDiseasesController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
  String? clientId ; 
  
  String _selectedGender = 'male';

  void _onGenderChanged(String value) {
    setState(() {
      _selectedGender = value;
      _genderController.text = value ; 
    });
  }

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imagecontroller.text = _imageFile.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: CustomAppBar(title: "Basic patient information".tr()),
      body: SingleChildScrollView(
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ProfileHeaderWidget(),
              SizedBox(height: 20,),
              CustomTextField(
                controller:_nameController,
                title: "Full Name".tr(),
                label: "Full Name".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _emailController,
                title: "Email".tr(),
                label: "Email".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              SectionLabel(text: 'Phone Number'.tr()),
              SizedBox(
                height: 80,
                child: IntlPhoneField(
                  controller: _phoneController,
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
              ),
              // CustomTextField(
              //   title: "Phone Number",
              //   label: "Phone Number",
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CustomTextField(
              //       title: "Age",
              //       label: "Age",
              //     ),
              //     CustomTextField(
              //       title: "Years",
              //       label: "Years",
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _cardController,
                title: "ID Card".tr(),
                label: "ID Card".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _healthNumberController,
                title: "Health number".tr(),
                label: "Health number".tr(),
              ),
              SizedBox(
                height: 20,
              ),

              _buildGenderSelection(),
              SizedBox(height: 10),

              CustomTextField(
                controller: _bloodTypeController,
                title: "Blood type".tr(),
                label: "Blood type".tr(),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'General health status'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                  fontFamily: "Montserrat"
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _chronicDiseasesController,
                title: "Chronic diseases".tr(),
                label: "Chronic diseases".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _allergyController,
                title: "Allergy to medications or foods".tr(),
                label: "Allergy to medications or foods".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _medicationsCurrentlyController,
                title: "Medications currently".tr(),
                label: "Medications currently".tr(),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
                controller: _lastDateforExaminationController,
                title: "Last date for examination".tr(),
                label: "Last date for examination".tr(),
              ),
              SizedBox(
                height: 5,
              ),

              Text(
                'State of emergency'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              CustomTextField(
              controller: _nearestPersonController,
              title: "nearest contact person".tr(),
                label: "nearest contact person".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _lastHospitalAdmissionDateController,
              title: "Date of last hospital admission".tr(),
                label: "Date of last hospital admission".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _surgeryController,
              title: "Having any previous surgeries".tr(),
                label: "Having any previous surgeries".tr(),

              ),
              SizedBox(
                height: 16,
              ),


              Text(
                'Health record and medical history'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _previousLaporatoryTestsAndDateController,
              title: "Previous laboratory tests and their dates".tr(),
                label: "Previous laboratory tests and their dates".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _medicalReportsRumorsAndTestsController,
              title: "Medical reports, rumors and tests".tr(),
                label: "Medical reports, rumors and tests".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _medicalDiagnosesController,
              title: "Medical Diagnoses and Treatment History".tr(),
                label: "Medical Diagnoses and Treatment History".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _vaccinationsController,
              title: "Vaccinations received and dates".tr(),
                label: "Vaccinations received and dates".tr(),

              ),
              SizedBox(
                height: 16,
              ),

              Text(
                'Previous medications and treatments'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _medicationsLastMonthsController,
              title: "List of medications used in the last 6-12 months".tr(),
                label: "List of medications used in the last 6-12 months".tr(),

              ),
              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _dosageAndRegularityController,
              title: "Dosage and regularity of taking it".tr(),
                label: "Dosage and regularity of taking it".tr(),

              ),
              SizedBox(
                height: 16,
              ),

              Text(
                'Family health history'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 5,
              ),

              CustomTextField(
                controller: _hereditaryDiseasesController,
                title:
                "The presence of hereditary diseases in the family (diabetes, high blood pressure, heart disease)".tr(),
                label:
                "The presence of hereditary diseases in the family (diabetes, high blood pressure, heart disease)".tr(),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'View all previous tests and analyses'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                'Compare the last 3-5 results for any given test'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8B8B8B),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              ChartPatientWidget(),

              SizedBox(
                height: 10,
              ),
              Text(
                'Upload medical files and x-rays'.tr(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFB93439),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // CustomContainerDecoration(
              //   height: 80,
              //   child: Padding(
              //     padding: const EdgeInsets.all(5.0),
              //     child: Column(
              //       children: [
              //         Text('Ability to upload X-rays, MRIs, and cardiac scans',
              //             style: TextStyle(
              //               fontSize: 14,
              //               fontWeight: FontWeight.w500,
              //               color: Color(0xff8B8B8B),
              //             )),
              //         SizedBox(
              //           height: 5,
              //         ),
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //           children: [
              //             GestureDetector(
              //               onTap: _pickFile,
              //               child:
              //               SvgPicture.asset("assets/images/file_icon.svg"),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              _buildImageUpload(),

              SizedBox(
                height: 5,
              ),
              CustomTextField(
              controller: _commentsController,
              title: "Comments".tr(),

                label: "",
              ),
              SizedBox(
                height: 30,
              ),
              
              ElevatedButton(
                  onPressed: () {
                     String? name= getIt<PreferencesRepository>().getString('userName');
                     String? phone = getIt<PreferencesRepository>().getString('phone');
                      context.read<CompeleteProfileCubit>().getCompeleteProfile(widget.id!,
                      CompleteProfileModel(
                        bloodType: _allergyController.text,
                        medicalDiagnoses: [_medicalDiagnosesController.text],
                        medicalReports: [_medicalReportsRumorsAndTestsController.text],
                        laboratoryTests:[LabTest(testName: _previousLaporatoryTestsAndDateController.text)],
                        vaccinations: [Vaccination(vaccineName: _vaccinationsController.text )],
                        previousTestComparisons:[ PreviousTestComparison(testName:_previousLaporatoryTestsAndDateController.text)],
                        comments: [Comment(text: _commentsController.text,)],
                        familyHealthHistory: _hereditaryDiseasesController.text,
                        idCard: _cardController.text,
                        healthNumber:_healthNumberController.text , 
                        chronicDiseases: _chronicDiseasesController.text, 
                        allergies:_allergyController.text ,
                        currentMedications: _medicationsCurrentlyController.text,
                        lastExaminationDate:_lastDateforExaminationController.text ,
                        emergencyContact: EmergencyContact(name:name, phone: phone),
                        lastHospitalAdmissionDate: _lastHospitalAdmissionDateController.text,
                        previousSurgeries:_surgeryController.text,
                        pastMedications: [PreviousMedication(medicationName: _medicationsLastMonthsController.text, )],
                        userName: _nameController.text,
                        email: _emailController.text,
                        gender: _genderController.text,
                        role:"client" ,
                        phone: _phoneController.text , 
                        
                      )
                      );

                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(390, 50),
                      padding: null,
                      backgroundColor: Color(0xFFB93439),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Save".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              SizedBox(height: 10,),

              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(390, 50),
                      padding: null,
                      backgroundColor: Color(0xFF49768C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Cancel".tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
              SizedBox(height: 10,),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Row(
      children: [
        Expanded(
          child: GenderSelectionButton(
            icon: Icons.male,
            label: 'Male'.tr(),
            value: 'male',
            isSelected: _selectedGender == 'male',
            onTap: () => _onGenderChanged('male'),

          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: GenderSelectionButton(
            icon: Icons.female,
            label: 'Female'.tr(),
            value: 'Female',
            isSelected: _selectedGender == 'Female',
            onTap: () => _onGenderChanged('Female'),
          ),
        ),
      ],
    );
  }

  Widget _buildImageUpload() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Drag image here Or Browse Image'.tr(),
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.grey[400],
              ),
              onPressed: () {
                _pickImage();
              },
            ),
          ),
        ],
      ),
    );
  }

}

