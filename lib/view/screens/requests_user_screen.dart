import 'package:beiti_care/feature/home/presentation/widgets/empty_requests.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:beiti_care/view/screens/data/session_model.dart';
import 'package:beiti_care/view/widgets/curved_navigation_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RequestsUserScreen extends StatefulWidget {
  const RequestsUserScreen({super.key});

  @override
  State<RequestsUserScreen> createState() => _RequestsUserScreenState();
}

class _RequestsUserScreenState extends State<RequestsUserScreen> {
  String? selectedBtn ;
  final List<String> options = ['Weekly', 'Monthly', 'Annual'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF3EFEF),
        title: Text(
          "Requests".tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFB93439),
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/back_button.png",
            width: 24.w,
            height: 24.h,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
         
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.tune,
                size: 30.w,
                color: const Color(0xff49768C),
              ),
              onSelected: (String value) {
                setState(() {
                  selectedBtn = value;
                });
                print('Selected: $value');
              },
              itemBuilder: (BuildContext context) {
                return options.map((String option) {
                  return PopupMenuItem<String>(
                    value: option,
                    child: Container(
                      width: 80.w,
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: selectedBtn == option
                            ? const Color(0xff49768C)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        option.tr(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: selectedBtn == option
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList();
              },
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
        
          )
        ]
        ,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: BlocBuilder<RequestsCubit, RequestsState>(
                builder: (context, state) {
                  if (state is RequestsLoading) {
                    return Center(
                      child: SizedBox(
                        width: 40.w,
                        height: 40.h,
                        child: const CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is RequestsError) {
                    return const EmptyRequests();
                  } 
                  else if (state is RequestsLoaded) {
                    List<SessionModel> displayedRequests = [];
                    if (selectedBtn == "Weekly") {
                      displayedRequests = state.weeklyRequests;
                    } else if (selectedBtn == "Monthly") {
                      displayedRequests = state.monthlyRequests;
                    } else if (selectedBtn == "Annual") {
                      displayedRequests = state.annualRequests;
                    } 
                    
                    else {
                      displayedRequests = state.requestsList;
                    }
                    if (displayedRequests.isEmpty) {
                      return const EmptyRequests();
                    }
                    return ListView.builder(
                      itemCount: displayedRequests.length,
                      itemBuilder: (context, index) {
                        final request = displayedRequests[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 20.0.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(
                                color: const Color(0xFF8B8B8B),
                                width: .6.w,
                              ),
                            ),
                            height: 150.h,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.0.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  buildTextWidget(
                                      "code".tr() + "           " + request.code),
                                      // "${"code".tr()}${request.code} #"),
                                  SizedBox(height: 4.3.h),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            buildTextWidget('Service'.tr()),
                                            SizedBox(height: 5.h),
                                            buildTextWidget('Nurse'.tr()),
                                            SizedBox(height: 5.h),
                                            buildTextWidget('Date'.tr()),
                                            SizedBox(height: 5.h),
                                            buildTextWidget('Location'.tr()),
                                          ],
                                        ),
                                        SizedBox(width: 20.h),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            buildTextWidget(request.service?.name ?? ""),
                                            SizedBox(height: 5.h),
                                            buildTextWidget(
                                                request.nurse?.userName ?? ''),
                                            SizedBox(height: 5.h),
                                            buildTextWidget(
                                              DateFormat('yyyy-MM-dd')
                                                  .format(request.createdAt),
                                            ),
                                            SizedBox(height: 5.h),
                                            buildTextWidget(
                                                request.nurse?.location ?? ''),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBarWidget(
        currentIndex: 3,
      ),
    );
  }


  Text buildTextWidget(String ? text) {
    return Text(
      text ?? 'un known',
      overflow: TextOverflow.clip,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: const Color(0xff7D7D7D),
      ),
    );
  }

}
