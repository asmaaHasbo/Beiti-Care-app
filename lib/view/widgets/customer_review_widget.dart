
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CustomerReviewWidget extends StatelessWidget {
  const CustomerReviewWidget({super.key,required this.data});
final Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {
    print('------------------- asma data length is ${data.length}');
    print('------------------- asma datas ${data['_id']}');
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color(0xFFF0F0F0),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 0.6,
                color: Color(0xFF7D7D7D),
              )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 16),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/images/nurse_image.png',
                    width: 48,
                    height: 48,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                     data['client']??'',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: 280,
                      child: Text(
                       data['comment']??'',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF5E5C5C)),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
