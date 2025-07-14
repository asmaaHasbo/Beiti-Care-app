import 'package:easy_localization/easy_localization.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/Group 1.svg',
    title: 'Your comfort matters to us! 🌿'.tr(),
    description: 'We provide high-quality home nursing care with personalized attention. Request now in easy and quick steps'.tr(),
  ),
  OnboardingModel(
    image: 'assets/images/Group 2.svg',
    title: 'Medical care is now closer to you! 🏥'.tr(),
    description: 'Request your specialized nurse anytime, anywhere'.tr(),
  ),
  OnboardingModel(
    image: 'assets/images/Group 3.svg',
    title: 'Your health is our priority! 🏥'.tr(),
    description: 'With our app, get home nursing services easily and comfortably.'.tr(),
  ),
];