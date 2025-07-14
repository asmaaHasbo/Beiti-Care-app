import 'dart:developer';
import 'package:beiti_care/common/helpers/get_nurse_by_services.dart';
import 'package:beiti_care/feature/app/presentation/global_page/loading_page.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/empty_services_screen.dart';
import '../widgets/nurses_card_widget.dart';
import 'api/dio_consumer.dart';
import 'cubit/requests_cubit.dart';

class NutritionNursesScreen extends StatefulWidget {
  const NutritionNursesScreen({super.key, required this.idServices});

  // final Map<String,dynamic> data;

  final String? idServices;

  @override
  State<NutritionNursesScreen> createState() => _NutritionNursesScreenState();
}

class _NutritionNursesScreenState extends State<NutritionNursesScreen> {
  bool isLoading = false;
  Map<String, dynamic> data = {};
  @override
  void initState() {
    getNurses();
    super.initState();
  }

  getNurses() async {
    setState(() {
      isLoading = true;
    });
    data = await GetNurseByServices.getNurses(widget.idServices ?? '');

// =======
//     data=await GetNurseByServices.getNurses(widget.idServices??'');
//    print("+++++++++++++++"+data.toString()+"++++++++++++++++++++++++++++++++++++");
// >>>>>>> compelete_profile
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Suggestions".tr()),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
          child: SizedBox(
              width: double.infinity,
              height: 785.h,
              child: isLoading
                  ? LoadingPage()
                  : (data['nurses'] == null || data['nurses'].isEmpty)
                  ? EmptyServicesScreen()
                  : ListView.builder(
                      itemCount: data['nurses'].length,
                      itemBuilder: (BuildContext context, int index) {
                        return BlocProvider(
                            create: (context) => RequestsCubit(
                                  NadaDioConsumer(dio: Dio()),
                                ),
                            child: NursesCardWidget(
                              nurseBio: '',
                              data: data['nurses'][index],
                            ));
                      },
                    ))),
    );
  }
}
