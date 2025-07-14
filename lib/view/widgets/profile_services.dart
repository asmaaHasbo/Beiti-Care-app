import 'package:flutter/material.dart';

class ProfileServices extends StatelessWidget {

  final  String title;
  final VoidCallback onTap;
  const ProfileServices({super.key , required this.title , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  color: Color(0xFFDBDBDB),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Color(0xFF8B8B8B),
                      width: 0.6
                  )
              ),
              child: Padding(padding: const EdgeInsets.all( 12),
                child: Text(title,style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.w500,color: Color(0xFF49768C),),),
              )
          ),
          SizedBox(height: 20,)
        ],
      ),
    );

  }
}