import 'package:beiti_care/feature/wallet/presentation/screens/wallet_pay.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../requests/presentation/widgets/custom_app_bar.dart';




class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
      // bottomNavigationBar: CustomBottomNavBar(currentIndex: 1,),
      appBar: CustomAppBar(title: 'Wallet'.tr(),),

      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            _buildWalletCard(
              balance:20,
              currency: 'USD',
              onPay: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => WalletPayScreen(),));

              },
              onWithdraw: () async {

              },
            ),

          ],
        ),
      )
    );
  }

  Widget _buildWalletCard({
    required double balance,
    required String currency,
    required VoidCallback onPay,
    required VoidCallback onWithdraw,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color:Color(0xff49768C)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/images/app_logo.png',
            width: 80.w,
            height: 80.w,
          ),
          SizedBox(height: 24.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monetization_on,
                color: Colors.amber,
                size: 24.w,
              ),
              SizedBox(width: 12.w),
              Text(
                '$balance',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 42.h),
          _buildActionButton(
            title: 'Pay'.tr(),
            backgroundColor: const Color(0xFF49768C),
            onPressed: onPay,
          ),
          SizedBox(height: 16.h),
          _buildActionButton(
            title: 'withdraw'.tr(),
            backgroundColor: const Color(0xFFB94A48),
            onPressed: onWithdraw,
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required String title,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }


  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    final color = isSelected ? const Color(0xFFB94A48) : Colors.grey;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color,
          size: 24.w,
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: color,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
