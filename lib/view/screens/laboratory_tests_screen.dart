// ignore_for_file: avoid_print

import 'package:beiti_care/view/asmaa_response/cubit/response_cubit.dart';
import 'package:beiti_care/view/asmaa_response/cubit/response_state.dart';
import 'package:beiti_care/view/widgets/empty_services_screen.dart';
import 'package:beiti_care/view/widgets/test_items.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';

class LaboratoryTestsScreen extends StatelessWidget {
  const LaboratoryTestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cubit = context.read<ResponseCubit>();
      cubit.getLaboratoryTests();
    });

    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: appBar(
          context,
          "Laboratory tests".tr(),
        ),
        body: BlocConsumer<ResponseCubit, ResponseState>(
          listener: (context, state) {
            if (state is MedicalFilesFailureState) {
              print('Error in laporatory Files: ${state.errorMsg}');
            }
          },
          builder: (context, state) {
            return Padding(
              padding:  EdgeInsets.symmetric(horizontal: 26.w  , vertical: 20.h),
              child: (state is LaboratoryTestsSuccessState)
                  ? TestItems(testsFiles: state.laboratoryTests)
                  : (state is LaboratoryTestsNoDataState)
                      ? EmptyServicesScreen()
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
            );
          },
        ));
  }
}
