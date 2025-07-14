import 'package:easy_localization/easy_localization.dart';
import 'package:beiti_care/view/screens/data/services_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/services_items.dart';

class NutritionScreen extends StatelessWidget {
   ServiceModel service ;  
 NutritionScreen({super.key,required this.service, });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
// <<<<<<< HEAD
//       appBar: appBar(context, "Nutrition".tr()),
// =======
      appBar: appBar(context, service.name),

      body: Padding(
        padding:  EdgeInsets.only(left: 20.w, right: 20.w),
        child: SizedBox(
          width: double.infinity,
          child: ListView.builder(
// <<<<<<< HEAD
//               itemCount: 3,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding:  EdgeInsets.only(bottom: 16.0.h   ),
//                   child: ServicesItems(idServices: idServices),
//                 );
// =======
              itemCount: service.subcategories.length,
              itemBuilder: (context, index) {
                return ServicesItems(serviceId: service.id,ServiceName: service.subcategories[index].name,
                  ServiceSubName: service.subcategories[index].name,description: service.description,
                  price:service.subcategories[index].cashPrice ,time: service.subcategories[index].duration.toString(),);
              }),
        ),
      ),
    );
  }
}
