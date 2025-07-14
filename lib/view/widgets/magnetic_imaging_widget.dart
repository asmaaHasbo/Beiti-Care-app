import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MagneticImagingWidget extends StatelessWidget {
  final Widget image;
  final String description;
  final String doctor;
  final String date;
  // final DateTime date;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  const MagneticImagingWidget(
      {super.key,
      required this.image,
      required this.description,
      required this.doctor,
      required this.date,
      required this.buttonText,
      required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: double.infinity,
          height: 177,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color(0xFF8B8B8B),
              width: 0.6,
            ),
          ),
          child: image
          // Image.asset("assets/images/imaging_background.png",
          //     fit: BoxFit.cover),
          ),
      SizedBox(
        height: 10,
      ),
      SizedBox(
        width: 355,
        height: 160,
        child: Text(
          description,
          // "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
          textAlign: TextAlign.justify,
          overflow: TextOverflow.clip,
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF8B8B8B),
          ),
        ),
      ),

      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Text(
            doctor,
            // "Dr / Omar",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFFB93439),
            ),
          ),
          SizedBox(
            width: 172.w,
          ),
          Text(
            date,
            // "Date : 2/2/2025",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF989494),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 174.h,
      ),
      if (buttonText != null && onButtonPressed != null)
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(390, 50),
                  padding: null,
                  backgroundColor: Color(0xFFB93439),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: onButtonPressed,
              child: Text(
                buttonText!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      // ElevatedButton(
      //     onPressed: () {
      //       showDialog(
      //           context: context,
      //           builder: (context) => const ConsultationDialog());
      //     },
      //     style: ElevatedButton.styleFrom(
      //         minimumSize: const Size(390, 50),
      //         padding: null,
      //         backgroundColor: Color(0xFFB93439),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(10))),
      //
      //     child: Text(
      //       "Request a consultation",
      //       style: const TextStyle(
      //         fontSize: 18,
      //         color: Colors.white,
      //         fontWeight: FontWeight.w600,
      //       ),
      //     ))
    ]);
  }
}
