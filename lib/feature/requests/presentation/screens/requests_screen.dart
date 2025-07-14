import 'package:beiti_care/feature/requests/presentation/bloc/request_bloc.dart';
import 'package:core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/models/page_state/result_builder.dart';
import '../../../app/presentation/global_page/error_page.dart';
import '../../../app/presentation/global_page/loading_page.dart';
import '../../../home/presentation/widgets/bottom_nav_bar.dart';
import '../widgets/request_card.dart';
import '../widgets/custom_app_bar.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  void initState() {
context.read<RequestBloc>().add(RequestClientEvent());    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 3,),
      appBar:  CustomAppBar(title: 'Requests'.tr()),
      body:   BlocBuilder<RequestBloc, RequestState>(
    builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: PageStateBuilder(
          init: Container(),
          success: (data) =>  data.pending.sessions.isEmpty?Center(
            child: Column(
              children: [
                250.verticalSpace,
                10.verticalSpace,
                AppText("No data".tr(),color: context.colorScheme.primary,),
              ],
            ),
          ):   ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: data.pending.sessions.length, // Replace with actual data length
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child:  RequestCard(
                  id: data.pending.sessions[index].id,
                  name:data.pending.sessions[index].client ,
                  location:data.pending.sessions[index].status.toString(),
                  service:data.pending.sessions[index].service.toString(),
                  time: data.pending.sessions[index].createdAt.toLocal().toString(),
                  code: data.pending.sessions[index].code.toString(), // Optional, might be null
                ),
              );
            },
          ),
          empty: Center(
            child: Column(
              children: [
                250.verticalSpace,
                10.verticalSpace,
                AppText("No data".tr(),color: context.colorScheme.primary,),
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
        ),
      );
    },
    ),
    );
  }
}

