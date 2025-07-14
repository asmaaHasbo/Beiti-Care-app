import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';
import 'all_patients_details.dart';

class AllPatientsData extends StatefulWidget {
  const AllPatientsData({super.key});

  @override
  State<AllPatientsData> createState() => _AllPatientsDataState();
}

class _AllPatientsDataState extends State<AllPatientsData> {

  void _openPage(){

     AllPatientsDetails();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: "All Patients Data".tr()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: 400,
                height: 800,
                // height: 600,
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return _patientWidget();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _patientWidget(){
    return Column(
      children: [
        Container(
          width: double.infinity,
          // height: 161,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 0.6, color: Colors.grey)),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ali Omar',
                              style: TextStyle(color: Colors.black),
                            ),
                            const SizedBox(height: 5),

                          ],
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: _openPage,
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            padding: null,
                            backgroundColor: Color(0xFFB93439),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: Text(
                          "Edit".tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ])),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }

}




