import 'package:beiti_care/common/helpers/get_reviews.dart';
import 'package:beiti_care/feature/app/presentation/global_page/loading_page.dart';
import 'package:beiti_care/view/screens/api/dio_consumer.dart' show NadaDioConsumer;

import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/customer_review_widget.dart';
import '../widgets/nurses_card_widget.dart';
import 'nutrition_nurses_screen.dart';

class DietaryAssessmentScreen extends StatefulWidget {
  const DietaryAssessmentScreen({super.key,required this.data});
final Map<String,dynamic> data;

  @override
  State<DietaryAssessmentScreen> createState() => _DietaryAssessmentScreenState();
}

class _DietaryAssessmentScreenState extends State<DietaryAssessmentScreen> {
  bool isLoading=false;
  Map<String,dynamic> data={};
  @override
  void initState() {
    getReviews();
    super.initState();
  }
  getReviews()async{
    setState(() {
      isLoading=true;
    });
    data=await GetAllReviews.getReviews(widget.data['_id']??'');
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: AppBar(
            backgroundColor: Color(0xFFF3EFEF),
            leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
                // Navigator.pushNamed(
                //   context,
                //   '/nutritionNurses',
                //   arguments: widget.data["services"], // تمرير serviceId هنا
                // );
                // Navigator.pushNamed(
                //   context,
                //   '/nutritionNurses',
                //   arguments: widget.data['services'],
                // );
                },
              child: Image.asset(
                "assets/images/back_button.png",
                width: 24,
                height: 24,
              ),
            ),
            title: Text("Nurse Details".tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFB93439), ),)
        ),
        // Navigator.pushNamed(context, '/details');
        // '/details': (context) => DetailsPage(),
        body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
            child:
            SingleChildScrollView(
              child: Column(
                children: [
                  BlocProvider(create: (context) => RequestsCubit(NadaDioConsumer(dio: Dio())),
                  child: NursesCardWidget(nurseBio: "",data: widget.data,),
                  ),

                  SizedBox(height: 15.h,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        "Customer reviews".tr(),
                        style: TextStyle(fontSize: 16.sp, color: Color(0xFFB93439), fontWeight: FontWeight.w600,
                        )
                    ),
                  ),
                  SizedBox(height: 15.h,),
                  isLoading?LoadingPage():
                  SingleChildScrollView(
                    child: SizedBox(
                      width: double.infinity,
                      height: 500.h,
                      child: ListView.builder(
                        itemCount: data['reviews'].length,
                        itemBuilder: (context, index) => CustomerReviewWidget(data: data['reviews'][index],),
                      ),
                    ),
                  )
                ],
              ),
            )

        ),
      ),
    );
  }
}

