
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../requests/presentation/widgets/custom_app_bar.dart';


class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3EFEF),
      appBar:  CustomAppBar(title: 'Policy Privacy'.tr()),

    );
  }

}
