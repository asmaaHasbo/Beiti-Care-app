import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';



class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();



  ///This for show notes for user in status success or  failure of  the operation
  static flutterToast(String text, Color colorMessage) {
    // Fluttertoast.showToast(
    //     msg: text.tr(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     timeInSecForIosWeb: 7,
    //     backgroundColor: colorMessage,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    BotToast.showCustomText(toastBuilder: (cancelFunc) {
      return Card(
      color: colorMessage,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 10),
                Text(text.tr(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0)),
              ],
            ),
          ));
    });

  }





}
