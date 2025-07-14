import 'package:beiti_care/feature/app/presentation/global_page/loading_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/helpers/get_about.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Map<String,dynamic> data={};
  bool isLoading=false;
  @override
  void initState() {
    getAbout();
    super.initState();
  }
  getAbout()async{
    setState(() {
      isLoading=true;
    });
    data=await GetAboutApp.about();
    setState(() {
      isLoading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'About'.tr()),
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // children: [
            //   Text("Our nursing services".tr(),
            //     style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w600,
            //         color: Color(0xFFB93439)),
            //   ),
            //   ListView.builder(
            //     shrinkWrap: true,
            //     physics: NeverScrollableScrollPhysics(),
            //     itemBuilder: (context, index) =>
            //     Text("We provide comprehensive healthcare in your home".tr(),
            //       style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w600,
            //           color: Color(0xFF8B8B8B)),
            //     ),
            //      itemCount: 8, )
            // ]
            children:
            isLoading?[
              Center(child: LoadingPage(),)
            ]: [
              Container(
                width: double.infinity,
                height: 160.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child:
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    data['setting']['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Our nursing services',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 16.h),
              _buildServiceItem(
                data['setting']['message'],            ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceItem(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: double.infinity,
        // padding: EdgeInsets.all(12.r),
        // decoration: BoxDecoration(
        //   // color: Colors.white,
        //   borderRadius: BorderRadius.circular(12.r),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withOpacity(0.05),
        //       blurRadius: 10,
        //       offset: const Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[700],
            height: 1.5,
          ),
        ),
      ),
    );
  }
}