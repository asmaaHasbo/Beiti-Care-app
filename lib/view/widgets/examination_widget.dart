import 'package:flutter/material.dart';

class ExaminationWidget extends StatelessWidget {
  final Widget image;
  final String title;
  final String description;
  final String date;
  // final DateTime date;
  final VoidCallback? onTap;
  const ExaminationWidget({super.key, required this.image, required this.title,
    required this.description, required this.date, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: onTap,
        //     () {
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => MagneticResonanceImaging()));
        // },
        child: Container(
          width: double.infinity,
          height: 127,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(
                  color: Color(0xFF8B8B8B), width: 0.6)),
          child: Row(
              children: [
                image,
            // Image.asset(
            //   "assets/images/imaging_background.png",
            //   width: 100,
            //   height: 120,
            //   fit: BoxFit.fill,
            // ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      title,
                      // "Magnetic resonance imaging",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFB93439),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      description,
                      // "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF8B8B8B),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    date,
                    // "Date : 2/2/2025",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF989494),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      );
  }
}
