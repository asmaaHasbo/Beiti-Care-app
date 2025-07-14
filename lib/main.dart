import 'dart:async';
import 'dart:io';
import 'package:beiti_care/core/di/di_container.dart';
import 'package:beiti_care/services/notification_service/push_notification_handler.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';
import 'core/api/client_config.dart';
import 'firebase_options.dart';
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(name: "BeitiCare");
  await configureDependencies();


  // PushNotificationsHandler.showNotificationWithPayload(message: message);
}
FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  print("fcm token ${await FirebaseMessaging.instance.getToken()}");

  await init();

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const App(),
  );
}

// test
Future<void> init() async {
  await   EasyLocalization.ensureInitialized();
  await configureDependencies();
  await PushNotificationsHandler().init();

  await ScreenUtil.ensureScreenSize();
  EasyLocalization.logger.enableLevels = [LevelMessages.error];
}


