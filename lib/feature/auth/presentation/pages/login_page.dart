import 'package:beiti_care/common/models/page_state/page_state.dart';
import 'package:beiti_care/feature/auth/domain/use_case/login_use_case.dart';
import 'package:beiti_care/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:beiti_care/feature/auth/presentation/pages/register_screen.dart';
import 'package:beiti_care/feature/home/presentation/screens/home_screen.dart';
import 'package:beiti_care/view/screens/welcome_screen.dart';
import 'package:core/core.dart';
import 'package:beiti_care/feature/home/presentation/widgets/bottom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../view/screens/cubit/requests_cubit.dart';
import '../../../../view/screens/cubit/services_cubit.dart';
import '../../../../view/screens/data/creat_request_model.dart';
import '../../data/model/login_model.dart';
import '../widgets/section_label.dart';
import 'forget_password_screen.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:dio/dio.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isClient = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // مفتاح للتحقق من صحة النموذج
  AuthBloc bloc = GetIt.I<AuthBloc>();
  bool _obscurePassword = true; // يجب تعريف هذه المتغير في حالة الـ State

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Form(
              key: _formKey, // ربط النموذج بمفتاح التحقق
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/Group 4.png',
                    height: 300.h,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: Color(0xffCECECE),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isClient = true),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              decoration: BoxDecoration(
                                // هنا التعديل: اللون يتغير بناءً على isClient
                                color: isClient
                                    ? context.colorScheme.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Client'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // هنا التعديل: اللون يتغير بناءً على isClient
                                  color: isClient
                                      ? Colors.white
                                      : Color(0xFF8B8B8B),
                                  fontSize: 20.sp,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => setState(() => isClient = false),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              decoration: BoxDecoration(
                                // هنا التعديل: اللون يتغير بناءً على isClient
                                color: !isClient
                                    ? context.colorScheme.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Nurse'.tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  // هنا التعديل: اللون يتغير بناءً على isClient
                                  color: !isClient
                                      ? Colors.white
                                      : Color(0xFF8B8B8B),
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8.r),
                  //     color: Color(0xffCECECE),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () => setState(() => isClient = true),
                  //           child: Container(
                  //             padding: EdgeInsets.symmetric(vertical: 12.h),
                  //             decoration: BoxDecoration(
                  //               color: isClient
                  //                   ? context.colorScheme.primary
                  //                   : Colors.transparent,
                  //               borderRadius: BorderRadius.circular(8.r),
                  //             ),
                  //             child: Text(
                  //               'Client'.tr(),
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 color: isClient
                  //                     ? Colors.white
                  //                     : Color(0xFF8B8B8B),
                  //                 fontSize: 20.sp,
                  //                 fontFamily: "Montserrat",
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () => setState(() => isClient = false),
                  //           child: Container(
                  //             padding: EdgeInsets.symmetric(vertical: 12.h),
                  //             decoration: BoxDecoration(
                  //               color: !isClient
                  //                   ? context.colorScheme.primary
                  //                   : Colors.transparent,
                  //               borderRadius: BorderRadius.circular(8.r),
                  //             ),
                  //             child: Text(
                  //               'Nurse'.tr(),
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 color: !isClient
                  //                     ? Colors.white
                  //                     : Color(0xFF8B8B8B),
                  //                 fontSize: 20.sp,
                  //                 fontWeight: FontWeight.w600,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Text(
                      'Log In'.tr(),
                      style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          color: context.colorScheme.primary),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SectionLabel(text: 'Email'.tr()),
                  TextFormField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email'.tr();
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 26.h),
// <<<<<<< HEAD
//                   TextFormField(
//                     controller: _passwordController,
//                     style: TextStyle(color: Colors.black, fontSize: 20.sp),
//                     obscureText: _obscurePassword, // استخدام المتغير هنا
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white,
//                       labelText: 'Password',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8.r),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _obscurePassword
//                               ? Icons.visibility_off
//                               : Icons.visibility,
//                           color: Colors.grey,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _obscurePassword = !_obscurePassword;
//                           });
//                         },
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       if (value.length < 6) {
//                         return 'Password must be at least 6 characters';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 8.h),

                  TextFormField(
                    controller: _passwordController,
                    style: TextStyle(color: Colors.black, fontSize: 20.sp),
                    obscureText: _obscurePassword, // استخدام المتغير هنا
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password'.tr(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'.tr();
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen()));
                      },
                      child: Text(
                        'Forget Password?'.tr(),
                        style: TextStyle(
                            color: Color(0xFF49768C),
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state.loginStatus.isLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            // التحقق من صحة النموذج قبل الإرسال
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(LoginEvent(
                                    param: LoginParam(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                    onSuccess: () async {
                                      final prefs =
                                          await SharedPreferences.getInstance();

                                      if (prefs.containsKey("nurseRole")) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen(),
                                          ),
                                        );
                                      } else if (prefs
                                          .containsKey("clientRole")) {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MultiBlocProvider(
                                                        providers: [
                                                          BlocProvider(
                                                              create: (context) =>
                                                                  RequestsCubit(
                                                                      NadaDioConsumer(
                                                                          dio:
                                                                              Dio()))),
                                                          BlocProvider(
                                                              create: (context) =>
                                                                  ServicesCubit(
                                                                      NadaDioConsumer(
                                                                          dio:
                                                                              Dio()))
                                                                    ..getServices()),
                                                        ],
                                                        child:
                                                            WelcomeScreen()))
                                        );
                                      }
                                    },
                                  ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colorScheme.primary,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Log in'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                            ),
// =======
//                         onPressed: () {
//                           // التحقق من صحة النموذج قبل الإرسال
//                           if (_formKey.currentState!.validate()) {
//                             bloc.add(LoginEvent(
//                               param: LoginParam(
//                                   email: _emailController.text,
//                                   password: _passwordController.text),
//                               onSuccess: () async {
//                                 String role= await getIt<PreferencesRepository>().getString('role')??'';
//                                 role=='client'?
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             WelcomeScreen())): Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             HomeScreen()));
//                               },
//                             ));
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: context.colorScheme.primary,
//                           padding: EdgeInsets.symmetric(vertical: 16.h),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.r),
//                           ),
//                         ),
//                         child: Text(
//                           'Log in'.tr(),
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.sp,
//                             fontWeight: FontWeight.w700,
// >>>>>>> batoul_new
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have account".tr(),
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff8B8B8B)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          'Register'.tr(),
                          style: TextStyle(
                            color: context.colorScheme.primary,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
