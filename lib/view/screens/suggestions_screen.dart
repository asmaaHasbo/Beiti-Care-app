import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:beiti_care/view/screens/cubit/services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/curved_navigation_bar.dart';
import '../widgets/suggestions_widget.dart';

class SuggestionsScreen extends StatelessWidget {
  SuggestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: appBar(context, "Services".tr()),
      bottomNavigationBar: CurvedNavigationBarWidget(
        currentIndex: 1,
      ),
      body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 8.h),
          child: Column(children: [

            // const SizedBox(height: 12),
            SizedBox(
                width: double.infinity,
                height: 688.h,
                child:BlocBuilder<ServicesCubit, ServicesState>(
                  builder: (context, state) {
                     if(state is ServicesLoading){
                       return const Center(child: CircularProgressIndicator(),);
                     }else if(state is ServicesLoaded){
                      final services = state.services;
                       return ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (BuildContext context, int index) {
                     return SuggestionsWidget(service:services[index]);

                     }
                      );
                }else if(state is ServicesError){
                  return Center(child: Text(state.errorMessage),);
                }
                return SizedBox.shrink();
                  },
                )),
          ])),
    );
  }
}
