import 'package:beiti_care/core/utils/extensions/build_context.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/helpers/get_patent_number.dart';
import '../../../../common/models/page_state/result_builder.dart';
import '../../../app/presentation/global_page/empty_page.dart';
import '../../../app/presentation/global_page/error_page.dart';
import '../../../app/presentation/global_page/loading_page.dart';
import '../../../profile/presentation/bloc/profile_bloc.dart';
import '../../../requests/presentation/bloc/request_bloc.dart';
import '../widgets/stats_card.dart';
import '../widgets/profile_header.dart';
import '../widgets/empty_requests.dart';
import '../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String,dynamic> data={};
  bool isLoading=false;
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    context.read<RequestBloc>().add(RequestClientEvent());
    getPatientNumer();
    super.initState();
  }
  getPatientNumer()async{
    setState(() {
      isLoading=true;
    });
    data=await GetNumberPatient.get();
    setState(() {
      isLoading=false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0,),
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header Section
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return PageStateBuilder(
                  init: Container(),
                  success: (data) =>
                      ProfileHeader(data: data,),
                  empty: const EmptyPage(),
                  loading:const LoadingPage(),
                  error: (error) =>
                      Padding(
                    padding: REdgeInsetsDirectional.only(top: 20),
                    child: ErrorPage(
                      onPressed: () {
                        context.read<ProfileBloc>().add(GetProfileEvent());
                      },
                    ),
                  ),
                  result: state.getProfile,
                );
              },
            ),

            // Stats Cards Section
            BlocBuilder<RequestBloc, RequestState>(
              builder: (context, state) {
                return PageStateBuilder(
                  init: Container(),
                  success: (data) =>     Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: StatsCard(
                            icon: Icons.pending,
                            title: 'Pending'.tr(),
                            value:data.pending.count==null?'0':data.pending.count.toString(),
                            color: Colors.grey[600]!,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: StatsCard(
                            icon: Icons.check_circle,
                            title: 'Completed'.tr(),
                            value: data.completed.count.toString(),
                            color: Colors.grey[600]!,
                          ),
                        ),
                      ],
                    ),
                  ),
                  empty: Center(
                    child: Column(
                      children: [
                        250.verticalSpace,
                        10.verticalSpace,
                      ],
                    ),
                  ),
                  loading:const LoadingPage(),
                  error: (error) =>Padding(
                    padding: REdgeInsetsDirectional.only(top: 20),
                    child: ErrorPage(
                      onPressed: () {
                        context.read<RequestBloc>().add(RequestClientEvent());
                        },
                    ),
                  ),
                  result: state.clientRequest,
                );
              },
            ),

            // Second Row of Stats Cards
            isLoading?LoadingPage():
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      icon: Icons.person,
                      title: 'Patient'.tr(),
                      value:data['count']==null?'0':data['count'].toString(),
                      color: Colors.grey[600]!,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: StatsCard(
                      icon: Icons.attach_money,
                      title: 'Total Revenue'.tr(),
                      value: '0',
                      color: Colors.grey[600]!,
                    ),
                  ),
                ],
              ),
            ),

            // Empty State Section
            // const Expanded(
            //   child: EmptyRequests(),
            // ),
          ],
        ),
      ),
    );
  }
}
