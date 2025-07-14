// ignore_for_file: avoid_print

import 'package:beiti_care/view/asmaa_response/cubit/response_cubit.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/chart_patient_widget.dart';
import '../widgets/test_items.dart';

class MedicalTestsScreen extends StatelessWidget {
  const MedicalTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعاء الدالتين يدويًا عند فتح الشاشة
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<ResponseCubit>();
      // استدعاء getListOfCompareingFiles إذا لم تكن الحالة ناجحة أو قيد التحميل
      // if (cubit.state is! CompareingFilesSuccessState &&
      //     cubit.state is! CompareingFilesLoadingState) {
      //   cubit.getListOfCompareingFiles();
      // }

      // استدعاء getMedicalFiles إذا لم تكن الحالة ناجحة أو قيد التحميل
      if (cubit.state is! MedicalFilesSuccessState &&
          cubit.state is! MedicalFilesLoadingState) {
        cubit.getMedicalFiles();
      }
    });
    return BlocConsumer<ResponseCubit, ResponseState>(
      listener: (context, state) {
        if (state is MedicalFilesFailureState) {
          print('Error in MedicalFiles: ${state.errorMsg}');
        }
        if (state is CompareingFilesFailureState) {
          print('Error in CompareingFiles: ${state.errorMsg}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xFFF3EFEF),
          appBar: appBar(context, "Medical Tests".tr()),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "view_all_tests".tr(),
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB93439)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "compare_results".tr(),
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF8B8B8B)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                //----------------------------------- digram -----------------------
                ChartPatientWidget(),
                SizedBox(height: 20.h),
                //------------------------------- files -------------------

                (state is MedicalFilesLoadingState)
                    ? Center(child: CircularProgressIndicator())
                    : (state is MedicalFilesSuccessState)
                        ? Expanded(
                            child: TestItems(testsFiles: state.medicalFiles))
                        : (state is MedicalFilesNoDataState)
                            ? Center(
                                child: Text('No medical test files exist'.tr()))
                            : Text('fail'),
              ],
            ),
          ),
        );
      },
    );
  }
}
