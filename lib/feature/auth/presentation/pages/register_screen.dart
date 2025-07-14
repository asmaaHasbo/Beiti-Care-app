import 'dart:io';
import 'package:beiti_care/common/helpers/get_all_Services.dart';
import 'package:beiti_care/common/helpers/register_client.dart';
import 'package:beiti_care/common/helpers/register_nurse.dart';
import 'package:beiti_care/feature/auth/presentation/pages/login_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/gender_selection_button.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widgets/section_label.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  bool _isPasswordVisible = true;
  bool _isConfirmPasswordVisible = true;
  String _selectedGender = 'male';
  String idSevices='';
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();



  Future<void> _pickImage() async {
    final XFile? pickedFile =
    await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Client Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _yearsController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Nurse Controllers
  final TextEditingController _nurseFullNameController =
      TextEditingController();
  final TextEditingController _nurseEmailController = TextEditingController();
  final TextEditingController _nursePhoneController = TextEditingController();
  final TextEditingController _nurseExperienceController =
      TextEditingController();
  final TextEditingController _nurseSpecialtyController =
      TextEditingController();
  final TextEditingController _nurseLocationController =
      TextEditingController();
  final TextEditingController _nurseIdCardController = TextEditingController();
  final TextEditingController _nursePasswordController =
      TextEditingController();
  final TextEditingController _nurseConfirmPasswordController =
      TextEditingController();
  bool isLOading=false;
Map<String,dynamic> data={};
bool isLoading=false;
  @override
  void initState() {
    super.initState();
    getAllServices();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
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
  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _isPasswordVisible = true;
        _isConfirmPasswordVisible = true;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    // Dispose Client Controllers
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _ageController.dispose();
    _yearsController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    // Dispose Nurse Controllers
    _nurseFullNameController.dispose();
    _nurseEmailController.dispose();
    _nursePhoneController.dispose();
    _nurseExperienceController.dispose();
    _nurseSpecialtyController.dispose();
    _nurseLocationController.dispose();
    _nurseIdCardController.dispose();
    _nursePasswordController.dispose();
    _nurseConfirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_tabController.index == 1) { // Nurse Tab
      if (_formKey1.currentState != null && _formKey1.currentState!.validate()) {
        setState(() {
          isLOading = true;
        });
        RegisterNurse.registerNurse(
          _nurseFullNameController.text,
          _nurseEmailController.text,
          _nursePasswordController.text,
          _nursePhoneController.text,
          _nurseExperienceController.text,
          // '67d2ed916ce7f2fc084ce6e7',
          idSevices,
          // _nurseSpecialtyController.text,
          _nurseLocationController.text,
          _nurseIdCardController.text,
          context,
          _imageFile,
        );
        setState(() {
          isLOading = false;
        });
      }
    } else { // Client Tab (index == 0)
      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
        setState(() {
          isLOading = true;
        });
        RegisterClient.registerClient(
          _fullNameController.text,
          _emailController.text,
          _passwordController.text,
          _phoneController.text,
          int.parse(_ageController.text),
          int.parse(_yearsController.text),
          _selectedGender,
          context,
        );
        setState(() {
          isLOading = false;
        });
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  void _onGenderChanged(String value) {
    setState(() {
      _selectedGender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3EFEF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 10.h),
              Image.asset(
                'assets/images/Group 4.png',
                height: 330.h,
              ),
              _buildTabBar(),
              SizedBox(height: 24.h),
              _buildTitle(),
              SizedBox(height: 24.h),
              SizedBox(
                height: 400.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [

                    _buildClientForm(),
                    _buildNurseForm(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFCECECE),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TabBar(
        labelStyle: TextStyle(
          color: Color(0xFF8B8B8B), fontSize: 20, fontWeight: FontWeight.w600
        ),
        dividerColor: Colors.transparent,
        controller: _tabController,
        indicator: BoxDecoration(
          color: const Color(0xFFB82C2C),
          borderRadius: BorderRadius.circular(8.r),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor: Color(0xFF8B8B8B),
        tabs:  [
          Tab(
            text: 'Client'.tr(),
          ),
          Tab(text: 'Nurse'.tr()),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Center(
      child: Text(
        'Register'.tr(),
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFB82C2C),
        ),
      ),
    );
  }

  Widget _buildClientForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SectionLabel(text: 'Full Name'.tr()),
            AuthTextField(
              controller: _fullNameController,
              hintText: 'Full Name'.tr(),
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Email'.tr()),
            AuthTextField(
              controller: _emailController,
              hintText: 'Email'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Phone Number'.tr()),

            SizedBox(
              height: 80,
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
                    borderSide: BorderSide(
                      color: Colors.transparent
                    ),
                  ),
                ),
                initialCountryCode: 'EG',
                onChanged: (phone) {
                  print('rrrrrrrrrrrrrrrrrrr${phone.countryISOCode}');
                  print(phone.completeNumber);
                  _phoneController.text=phone.completeNumber;
                },
              ),
            ),

            // PhoneField(controller: _phoneController),
            // SizedBox(height: 16.h),
            _buildAgeYearsRow(),
            SizedBox(height: 16.h),
            //Specialty field

            _buildGenderSelection(),
            SizedBox(height: 16.h),
            _buildPasswordFields(
              passwordController: _passwordController,
              confirmPasswordController: _confirmPasswordController,
            ),
            SizedBox(height: 24.h),
            _buildRegisterButton(),
            SizedBox(height: 16.h),
            _buildLoginLink(),
            SizedBox(height: 24.h),

          ],
        ),
      ),
    );
  }

  Widget _buildNurseForm() {
    return Form(
      key: _formKey1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SectionLabel(text: 'Full Name'.tr()),
            AuthTextField(
              controller: _nurseFullNameController,
              hintText: 'Full Name'.tr(),
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Email'.tr()),
            AuthTextField(
              controller: _nurseEmailController,
              hintText: 'Email'.tr(),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Image'.tr()),
            _buildImageUpload(),
            SizedBox(height: 4.h),
            Text(
              'Please upload your medical qualification certificate.'.tr(),
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Experience'.tr()),
            AuthTextField(
              controller: _nurseExperienceController,
              hintText: 'Experience'.tr(),
            ),
            SizedBox(height: 16.h),
            DropdownButtonFormField<String>(
              isExpanded: true,
              dropdownColor: Colors.white,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                labelText: 'Specialty'.tr(),
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

            SizedBox(height: 16.h),
             SectionLabel(text: 'Location'.tr()),
            AuthTextField(
              controller: _nurseLocationController,
              hintText: 'Location'.tr(),
            ),
            SizedBox(height: 16.h),
             SectionLabel(text: 'Phone Number'.tr()),

           
            SizedBox(height: 16.h),
            SizedBox(
              height: 80,
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
                  _nursePhoneController.text=phone.completeNumber;
                },
              ),
            ),
            // SizedBox(height: 5.h),
            SectionLabel(text: 'ID Card'.tr()),
            AuthTextField(
              controller: _nurseIdCardController,
              hintText: 'ID Card'.tr(),
            ),
            SizedBox(height: 16.h),
            _buildPasswordFields(
              passwordController: _nursePasswordController,
              confirmPasswordController: _nurseConfirmPasswordController,
            ),
            SizedBox(height: 24.h),
            isLOading?CircularProgressIndicator():
            _buildRegisterButton(),
            SizedBox(height: 16.h),
            _buildLoginLink(),
            SizedBox(height: 24.h),

          ],
        ),
      ),
    );
  }

  Widget _buildImageUpload() {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'image here Or Browse Image'.tr(),
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
          Container(
            width: 56.w,
            height: 56.h,
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

  Widget _buildAgeYearsRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SectionLabel(text: 'Age'.tr()),
              AuthTextField(
                controller: _ageController,
                hintText: 'Age'.tr(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SectionLabel(text: 'Years'.tr()),
              AuthTextField(
                controller: _yearsController,
                hintText: 'Years'.tr(),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ],
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
        SizedBox(width: 16.w),
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

  Widget _buildPasswordFields({
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SectionLabel(text: 'Password'.tr()),
        AuthTextField(
          controller: passwordController,
          hintText: 'Password'.tr(),
          obscureText: _isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        SizedBox(height: 16.h),
         SectionLabel(text: 'Confirm Password'.tr()),
        AuthTextField(
          controller: confirmPasswordController,
          hintText: 'Confirm Password'.tr(),
          obscureText: _isConfirmPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              _isConfirmPasswordVisible
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: _toggleConfirmPasswordVisibility,
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterButton() {
    return isLOading?CircularProgressIndicator():ElevatedButton(
      onPressed: _handleRegister,
      child:  Text('Register'.tr(), style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700
      ),),
    );
  }

  Widget _buildLoginLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          'Already have an account? '.tr(),
          style: TextStyle(color: Color(0xff8B8B8B), fontSize: 18,
            fontWeight: FontWeight.w600,),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage()));
          },
          child:  Text(
            'Log in'.tr(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB82C2C),
            ),
          ),
        ),
      ],
    );
  }
}
