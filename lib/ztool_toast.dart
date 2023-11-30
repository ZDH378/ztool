import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ztool/ztool.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

typedef PKLoadingStatusCallback = void Function(EasyLoadingStatus status);

class ZzToast {
  static ZzToast _instance = ZzToast();

  static ZzToast get instance => _instance;

  bool _hadConfig = false;

  /* 计时器 */
  Timer? _timer;

  /// 配置加载控件样式
  static void config() {
    if (ZzToast.instance._hadConfig) {
      return;
    }

    ZzToast.instance._hadConfig = true;

    EasyLoading.instance.successWidget = Image(
      image: const AssetImage(
        'assets/images/icon_success.png',
        package: "ztool",
      ),
      width: 42.0.rpx,
      height: 42.0.rpx,
    );

    EasyLoading.instance.errorWidget = Image(
      image: const AssetImage(
        'assets/images/icon_error.png',
        package: "ztool",
      ),
      width: 42.0.rpx,
      height: 42.0.rpx,
    );

    EasyLoading.instance.progressColor = Colors.white;
    EasyLoading.instance.radius = 12.0.rpx;
    EasyLoading.instance.fontSize = 15.0.rpx;

    EasyLoading.instance.textPadding = EdgeInsets.all(15.0.rpx);
    EasyLoading.instance.contentPadding =
        EdgeInsets.fromLTRB(15.0.rpx, 10.0.rpx, 15.0.rpx, 10.0.rpx);

    EasyLoading.instance.indicatorWidget = PKLoadingIndicator();
    EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.instance.backgroundColor = Colors.black.withOpacity(0.6);
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.instance.indicatorColor = Colors.white;
  }

  /// 在展示 Loading、Info、Success、Error 时，做如下特殊配置
  static void _configPaddingExceptForToast() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.instance.contentPadding =
        EdgeInsets.fromLTRB(15.0.rpx, 0.0.rpx, 15.0.rpx, 17.0.rpx);
    EasyLoading.instance.fontSize = 15.0.rpx;
  }

  /// 在展示 Toast 时，做如下特殊配置
  static void _configPaddingForToast() {
    EasyLoading.instance.contentPadding =
        EdgeInsets.fromLTRB(15.0.rpx, 10.0.rpx, 15.0.rpx, 10.0.rpx);
    EasyLoading.instance.userInteractions = true;
    EasyLoading.instance.fontSize = 15.0.rpx;
  }

  /// 展示 Toast
  static void showToast(String status, {Duration? duration}) {
    // LoadingContrller.shared.cancelLoading();
    // _configPaddingForToast();
    // EasyLoading.showToast(status, duration: duration);
    OKToasting.showOkToast(status, duration: duration);
  }

  /// 展示 Toast
  static void showDebugToast(String status) {
    // if (HttpConfig.isProduct == false && HttpConfig.isDebug == true) {
    //   OKToasting.showOkToast(status, duration: Duration(seconds: 5));
    // }
    // Api.appLog("发生错误", status);
  }

  /// 展示加载中
  static void show({String status = "加载中..."}) {
    _configPaddingExceptForToast();
    EasyLoading.instance.userInteractions = false;
    EasyLoading.instance.contentPadding =
        EdgeInsets.fromLTRB(15.0.rpx, 0.0.rpx, 15.0.rpx, 17.0.rpx);
    EasyLoading.show(status: status);
  }

  /// 展示成功信息
  static void showSuccess(String status) {
    EasyLoading.dismiss();
    _configPaddingExceptForToast();
    OKToasting.showOkSuccess(status);

    // EasyLoading.showSuccess(status);
  }

  /// 展示错误信息
  static void showError(String status, {Duration? duration}) {
    // if (kDebugMode) {}
    // LoadingContrller.shared.cancelLoading();
    // _configPaddingExceptForToast();
    // EasyLoading.showError(status, duration: duration);
    EasyLoading.dismiss();
    OKToasting.showOkError(status);
  }

  /// 展示提示信息
  static void showInfo(String status) {
    // _configPaddingExceptForToast();
    // LoadingContrller.shared.cancelLoading();
    // EasyLoading.showInfo(status);
    EasyLoading.dismiss();
    OKToasting.showOKInfo(status);
  }

  /// dismiss
  static void dismiss({bool animation = true}) {
    EasyLoading.dismiss(animation: animation);
  }

  /// 添加监听状态回调
  static void addStatusCallback(PKLoadingStatusCallback callback) {
    EasyLoading.addStatusCallback(callback);
  }

  /// 移除监听状态回调
  static void removeCallback(PKLoadingStatusCallback callback) {
    EasyLoading.removeCallback(callback);
  }
}

/// 加载中视图
class PKLoadingIndicator extends StatefulWidget {
  final Color? loadingColor;
  const PKLoadingIndicator({Key? key, this.loadingColor}) : super(key: key);

  @override
  State<PKLoadingIndicator> createState() => _PKLoadingIndicatorState();
}

class _PKLoadingIndicatorState extends State<PKLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    controller.forward();
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画从 controller.forward() 正向执行 结束时会回调此方法
        // dPrint("status is completed");
        //重置起点
        controller.reset();
        //开启
        controller.forward();
      } else if (status == AnimationStatus.dismissed) {
        //动画从 controller.reverse() 反向执行 结束时会回调此方法
        // dPrint("status is dismissed");
      } else if (status == AnimationStatus.forward) {
        // dPrint("status is forward");
        //执行 controller.forward() 会回调此状态
      } else if (status == AnimationStatus.reverse) {
        //执行 controller.reverse() 会回调此状态
        // dPrint("status is reverse");
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 80.0.rpx,
      child: RotationTransition(
        //设置动画的旋转中心
        alignment: Alignment.center,
        //动画控制器
        turns: controller,
        //将要执行动画的子view
        child: Image(
          image: const AssetImage(
            'assets/images/icon_loading.png',
            package: "ztool",
          ),
          width: 42.0.rpx,
          height: 42.0.rpx,
          color: widget.loadingColor,
        ),
      ),
    );
  }
}

class OKToasting {
  static ToastFuture? toastFuture;
  static void showOkToast(String msg, {Duration? duration}) {
    Duration aniDuration = Duration(milliseconds: 150);
    if (toastFuture?.dismissed == false) {
      toastFuture?.dismiss(showAnim: false);
    }
    toastFuture = showToast(
      msg,
      duration: duration,
      textStyle: ZzFonts.fontMediumWhite(18),
      animationDuration: aniDuration,
      textPadding: EdgeInsets.fromLTRB(50.0.rpx, 25.0.rpx, 50.0.rpx, 25.0.rpx),
    );
  }

  static void _showOkWidgetInfo(Widget widget, String msg,
      {Duration? duration}) {
    Duration aniDuration = Duration(milliseconds: 150);
//
    if (toastFuture?.dismissed == false) {
      toastFuture?.dismiss(showAnim: false);
    }
    toastFuture = showToastWidget(
      Container(
        padding: EdgeInsets.fromLTRB(15.0.rpx, 15.0.rpx, 15.0.rpx, 17.0.rpx),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0.rpx),
          color: Colors.black.withOpacity(0.6),
        ),
        constraints: BoxConstraints(minWidth: 100.0.rpx, maxWidth: 250.0.rpx),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 42.0.rpx,
              height: 42.0.rpx,
              child: widget,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0.rpx),
              child: Text(
                msg,
                style: TextStyle(fontSize: 15.0.rpx, color: Colors.white),
              ),
            )
          ],
        ),
      ),
      animationDuration: aniDuration,
    );
  }

  static void showOkSuccess(String msg, {Duration? duration}) {
    _showOkWidgetInfo(
        Image.asset(
          'assets/images/icon_success.png',
          package: "ztool",
        ),
        msg,
        duration: duration);
  }

  static void showOkError(String msg, {Duration? duration}) {
    _showOkWidgetInfo(
        Image.asset(
          'assets/images/icon_error.png',
          package: "ztool",
        ),
        msg,
        duration: duration);
  }

  static void showOKInfo(String msg, {Duration? duration}) {
    _showOkWidgetInfo(
        Icon(
          Icons.info_outline,
          color: Colors.white,
          size: 42.0.rpx,
        ),
        msg,
        duration: duration);
  }
}
