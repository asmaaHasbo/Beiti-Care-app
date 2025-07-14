import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../widgets/app_bar_widget.dart';
import '../widgets/empty_services_screen.dart';

class GeneticTestingScreen extends StatelessWidget {
  const GeneticTestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3EFEF),
    appBar: appBar(context, "Genetic testing".tr()),
    body:
        EmptyServicesScreen(),

    );
  }
}
