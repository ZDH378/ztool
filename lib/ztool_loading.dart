import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:loading_indicator_view_plus/loading_indicator_view_plus.dart';
import 'package:ztool/ztool.dart';

class ZzLoading {
  static show({bool isAutoDismiss = true}) async {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      // ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskType = EasyLoadingMaskType.custom
      ..radius = 18.0
      ..progressColor = ZzColor.whiteColor
      ..backgroundColor = ZzColor.colorToD9B0FE
      ..indicatorColor = ZzColor.whiteColor
      ..textColor = ZzColor.whiteColor
      ..toastPosition = EasyLoadingToastPosition.top
      ..maskColor = const Color.fromRGBO(0, 0, 0, 0.3)
      ..contentPadding = EdgeInsets.zero
      ..animationDuration = const Duration(milliseconds: 150)
      ..animationStyle = EasyLoadingAnimationStyle.offset;
    await EasyLoading.show(
        //maskType: EasyLoadingMaskType.custom,
        indicator: SizedBox(
            width: 80.0.rpx,
            height: 80.0.rpx,
            child: Center(
              child: SizedBox(
                // width: 60,
                // height: 60,
                child: LineScaleIndicator(),
              ),
            )));
    if (isAutoDismiss) {
      _autoDismiss(); //
    }
  }

  static showMessage(String text) async {
    ZzToast.showInfo(text);
  }

//8秒自动消失
  static _autoDismiss({int seconds = 8}) {
    Future.delayed(Duration(seconds: seconds), () {
      EasyLoading.dismiss();
    });
  }

//
  static dismissLate1000mill() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      EasyLoading.dismiss();
    });
  }

  static dismissLate500mill() {
    Future.delayed(const Duration(milliseconds: 500), () {
      EasyLoading.dismiss();
    });
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
