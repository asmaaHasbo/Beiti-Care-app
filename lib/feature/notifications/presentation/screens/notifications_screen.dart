import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../common/helpers/get_all_notification.dart';
import '../../../../view/widgets/empty_services_screen.dart';
import '../../../app/presentation/global_page/empty_page.dart';
import '../../../app/presentation/global_page/loading_page.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';
import '../widgets/notification_item.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Map<String, dynamic> data = {};
  bool isLoading = false;
  @override
  void initState() {
    getNotification();
    super.initState();
  }

  getNotification() async {
    setState(() {
      isLoading = true;
    });
    data = await GetAllNotification.allNotification();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar: CustomAppBar(title: 'Notifications'.tr()),
      body:

      isLoading
          ? Column(
              children: [
                Center(
                  child: LoadingPage(),
                )
              ],
            )
          : (data['notifications'] == null || data['notifications'].isEmpty)

      // : data['notifications'].isEmpty
              ? EmptyServicesScreen()
              : ListView.builder(
                  itemCount: data['notifications'].length,
                  itemBuilder: (context, index) => NotificationItem(
                    message: data['notifications'][index]['message'],
                    isRead: false,
                    // icon: Icons.check_circle_outline,
                    // iconColor: Colors.green,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                ),
    );
  }
}

