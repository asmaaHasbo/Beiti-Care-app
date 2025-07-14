import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../requests/presentation/widgets/custom_app_bar.dart';



class WithdrawHistoryScreen extends StatelessWidget {
   WithdrawHistoryScreen({super.key});
 List<dynamic> withdrawHistory=  [
  {
  'phoneNumber': '01023625821',
  'amount': '500 EGP',
  'date': '22/1/2024',
  'isComplete': true,
  },
  {
  'phoneNumber': '01023625821',
  'amount': '500 EGP',
  'date': '22/1/2024',
  'isComplete': true,
  },
  {
  'phoneNumber': '01023625821',
  'amount': '500 EGP',
  'date': '22/1/2024',
  'isComplete': true,
  },
  ];
  @override
  Widget build(BuildContext context,) {

    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'Withdraw History'.tr()),
      body:ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemCount: withdrawHistory.length,
        itemBuilder: (context, index) {
          final item = withdrawHistory[index];
          return Padding(
            padding: EdgeInsets.only(bottom: 16.h),
            child: _buildWithdrawCard(
              phoneNumber: item['phoneNumber'],
              amount: item['amount'],
              date: item['date'],
              isComplete: item['isComplete'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildWithdrawCard({
    required String phoneNumber,
    required String amount,
    required String date,
    required bool isComplete,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoRow(
              title: 'Cash Phone Number'.tr(),
              value: phoneNumber,
            ),
            SizedBox(height: 8.h),
            _buildInfoRow(
              title: 'Amount'.tr(),
              value: amount,
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'process is complete'.tr(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.green,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[800],
            ),
          ),
        ),
      ],
    );
  }
}

// Model class for withdraw history item
class WithdrawHistoryItem {
  final String phoneNumber;
  final String amount;
  final String date;
  final bool isComplete;

  WithdrawHistoryItem({
    required this.phoneNumber,
    required this.amount,
    required this.date,
    required this.isComplete,
  });
}
