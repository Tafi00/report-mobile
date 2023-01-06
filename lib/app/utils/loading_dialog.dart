import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  // show the loading dialog
  Get.dialog(
      name: 'Loading Dialog',
      barrierDismissible: false,
      Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                // The loading indicator
                SpinKitCircle(
                  color: Colors.white,
                  duration: Duration(milliseconds: 500),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )));
}
