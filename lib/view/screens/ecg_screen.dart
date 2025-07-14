import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/consultation_dialog.dart';
import '../widgets/magnetic_imaging_widget.dart';

class EcgScreen extends StatefulWidget {
  const EcgScreen({super.key});

  @override
  State<EcgScreen> createState() =>
      _EcgScreenState();
}

class _EcgScreenState extends State<EcgScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
        appBar: appBar(
          context,
          "ECG".tr(),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 26.w, vertical: 20.h),
          child: MagneticImagingWidget(
            image:
            Image.asset("assets/images/ecg_large.png",
                fit: BoxFit.cover),
            description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a "
                "galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",
            doctor: 'Dr / Omar',
            date: 'Date : 2/2/2025',
            buttonText: 'Request a consultation',
            onButtonPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => const ConsultationDialog());
            },

          ),
        ));
  }
}
