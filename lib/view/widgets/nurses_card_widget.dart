import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/feature/app/domain/repo/preferences_repository.dart';
import 'package:beiti_care/view/screens/cubit/requests_cubit.dart';
import 'package:beiti_care/view/screens/data/creat_request_model.dart';
import 'package:beiti_care/view/widgets/waiting_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../feature/profile/data/model/user_model.dart';
import '../screens/dietary_assessment_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:beiti_care/feature/profile/data/model/user_model.dart';

import '../screens/nutrition_nurses_screen.dart';

class NursesCardWidget extends StatefulWidget {
  final String nurseBio;
  final Map<String, dynamic>? data;
  const NursesCardWidget({super.key, required this.nurseBio, this.data});

  @override
  State<NursesCardWidget> createState() => _NursesCardWidgetState();
}

class _NursesCardWidgetState extends State<NursesCardWidget> {
  // bool _isDietaryAssessmentScreenOpen = false;

  // bool tapped = false;

  @override
  Widget build(BuildContext context) {
    final String? id = getIt<PreferencesRepository>().getString('idUser');
    print("+++++++++++++${widget.data}+++++++++++++++++++++++++++++++++++++");

    return InkWell(
      onTap:
          //tapped ?
          () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DietaryAssessmentScreen(
                      data: widget.data ?? {},
                    )));
      }
      // : null
      ,
      child: Column(
        children: [
          Container(
            width: 350.w,
            // height: 161,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(width: 0.6.w, color: Colors.grey)),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // buildProfileHeader(data),

                          ClipOval(
                              child: SizedBox(
                            width: 50.w,
                            height: 50.h,
                            child: widget.data?["image"] == "" ||
                                    widget.data?["image"] == null
                                ? Image.asset(
                                    "assets/images/no-profile_image.jpg",
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(widget.data?["image"]),
                          )),
                          SizedBox(width: 5.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.data?['userName'] ?? '',
                                style: TextStyle(color: Colors.black),
                              ),
                              const SizedBox(height: 5),
                              RatingBar.builder(
                                initialRating:
                                    widget.data?['rating'].toDouble() ?? 0.0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                updateOnDrag: false,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 2.0),
                                itemSize: 18,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 10,
                                ),
                                ignoreGestures: true,
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                  width: 220.w,
                                  child: Text(
                                    widget.nurseBio,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                        color: Color(0xFF5E5C5C)),
                                    overflow: TextOverflow.clip,
                                  )),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/money.png",
                                    width: 16.w,
                                    height: 16.h,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(getNursePrice(widget.data!),
// =======
//                                 Text( getNursePrice(data!),
// >>>>>>> compelete_profile
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Color(0xFFC69100),
                                      )),
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  Icon(
                                    Icons.watch_later_outlined,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 3.w),
                                  Text(getNurseDuration(widget.data!),
                                      // getNurseDuration(data!),
                                      style: TextStyle(
                                        fontSize: 14.w,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                "Number of cases served".tr() +
                                    "${widget.data?['clients'].length}",
                                style: TextStyle(color: Color(0xFFB93439)),
                              ),

                              //     Text(
                              //         data?['specialty'] != null
                              //             ? (data?['specialty'][0]['price']
                              //                     .toString()) ??
                              //                 ''
                              //             : '',
                              //         style: TextStyle(
                              //           fontSize: 14.sp,
                              //           color: Color(0xFFC69100),
                              //         )),
                              //     SizedBox(
                              //       width: 25.w,
                              //     ),
                              //     Icon(
                              //       Icons.watch_later_outlined,
                              //       color: Colors.black,
                              //     ),
                              //     SizedBox(width: 3.w),
                              //     Text(
                              //         data?['specialty'] != null
                              //             ? (data?['specialty'][0]['duration']
                              //                     .toString()) ??
                              //                 ''
                              //             : '',
                              //         style: TextStyle(
                              //           fontSize: 14.w,
                              //           color: Colors.black,
                              //         ))
                              //   ],
                              // ),
                              // SizedBox(height: 8.h),
                              // Text(
                              //   "Number of cases served ${data?['clients'].length}"
                              //       .tr(),
                              //   style: TextStyle(color: Color(0xFFB93439)),
                              // ),
                              SizedBox(height: 20.h)
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () {
                            final specialtyName =
                                (widget.data?['specialty'] is List &&
                                        widget.data!['specialty'].isNotEmpty)
                                    ? widget.data!['specialty'][0]['name'] ??
                                        'Surgical Care'
                                    : 'Surgical Care';
                            context
                                .read<RequestsCubit>()
                                .createRequest(CreateRequest(
                                  client: id!,
                                  nurse: widget.data?['_id'] ?? '',
                                  service: specialtyName,
                                ));
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const WaitingDialog();
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(390.w, 50.h),
                              padding: null,
                              backgroundColor: Color(0xFFB93439),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r))),
                          child: Text(
                            "Book Now".tr(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ))
                    ])),
          ),
          SizedBox(height: 15.h)
        ],
      ),
    );
  }

  String getNursePrice(Map<String, dynamic> data) {
    if (data.containsKey('specialty') &&
        data['specialty'] is List &&
        (data['specialty'] as List).isNotEmpty &&
        data['specialty'][0]['price'] != null) {
      return data['specialty'][0]['price'].toString();
    }

    return '';
  }

  String getNurseDuration(Map<String, dynamic> data) {
    if (data.containsKey('specialty') &&
        data['specialty'] is List &&
        (data['specialty'] as List).isNotEmpty &&
        data['specialty'][0]['duration'] != null) {
      return data['specialty'][0]['duration'].toString();
    }

    return '';
  }
}
