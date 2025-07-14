import 'package:beiti_care/view/screens/api/dio_consumer.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:dio/dio.dart';
import 'package:beiti_care/view/screens/data/services_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../screens/nutrition_nurses_screen.dart';
import '../screens/search_screen.dart';


class ServicesItems extends StatelessWidget {
  String ServiceName ; 
  String ServiceSubName ; 
  String description ; 
  double price ;
  String time ; 
  String serviceId;
   ServicesItems({super.key , required this.ServiceName , required this.ServiceSubName , required this.description , required this.price , required this.time , required this.serviceId});
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Container(
          width: double.infinity,
          // height: 183,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.6, color: Colors.grey),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10, ),
                        child:
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 0.3,
                                  color: Colors.grey),
                              color: Colors.grey.shade300
                          ),
                          child: Image.asset(
                            "assets/images/health.png",
                            width: 25,
                            height: 25,
                          ),
                        ),
                        ),
                      SizedBox(width: 10.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(ServiceName,
                                overflow: TextOverflow.clip,
        
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Color(0xFFB93439),
                                )),
                          ),
                          Text(ServiceSubName,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.grey,
                              ))
                        ],
                      ),
        
                        ]
                      ),
        
                  Column(
                    children: [
        
                      SizedBox(height: 10,),
        
                      Text(
                          description, style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      )),
        
                      const SizedBox(
                        height: 11,
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/images/money.png",
                            width: 16,
                            height: 16,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text("${price} D.A",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFC69100),
                              )),
                          const SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(time.toString() + " Minutes".tr(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        SizedBox(
                          width: 175,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                backgroundColor: Color(0xFF49768C),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => SearchScreen()));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    // width: 70,
                                    // height: 40,
                                    child: Text(
                                      "Find a nurse".tr(),
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  // const SizedBox(width: 40),
                                  Icon(Icons.search, size: 28, color: Colors.white,)
        
                                ],
                              )),
                        ),
                        // const SizedBox(width: 30),
                        SizedBox(
                          width: 117,
                          height: 40,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: Colors.grey.shade300,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: const BorderSide(
                                        width: 0.3, color: Colors.grey)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => NutritionNursesScreen(idServices: serviceId,)));
                              },
                              child: Text(
                                "Show More".tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16, color: Color(0xFF49768C)),
                              )),
                        ),
                      ])
        
                    ],
                  ),
                 
                ],
                  ),
          ),
          ),
           SizedBox(height: 10,),
      ],
    );

  }
}
