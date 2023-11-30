import 'dart:io';

import 'package:flutter/material.dart';

class ZzScreen {
  static final ZzScreen _singleton = ZzScreen._internal();

  factory ZzScreen() {
    return _singleton;
  }

  ZzScreen._internal();

  late BuildContext _context;
  late MediaQueryData _mediaQueryData;
  late double _screenWidth = 384.0;
  late double _screenHeight = 792.0;
  late double _paddingBottom = 0;
  late double _paddingTop = 0;

  void setContent(BuildContext context) {
    _context = context;

    _mediaQueryData = MediaQueryData.fromView(View.of(context));
    if (mediaQueryData.size.width > 0) {
      _screenWidth = mediaQueryData.size.width;
    }
    if (mediaQueryData.size.height > 0) {
      _screenHeight = mediaQueryData.size.height;
    }
    if (mediaQueryData.padding.bottom > 0) {
      _paddingBottom = mediaQueryData.padding.bottom;
    }
    if (mediaQueryData.padding.top > 0) {
      _paddingTop = mediaQueryData.padding.top;
    }

    // print("屏幕信息--$_screenWidth,$_screenHeight,$_paddingTop,$_paddingBottom");
  }

  BuildContext get context => _context;
  MediaQueryData get mediaQueryData => _mediaQueryData;
  double get screenWidth => _screenWidth;
  double get screenHeight => _screenHeight;
  double get paddingBottom => _paddingBottom;
  double get paddingTop => _paddingTop;
}

class HYSizeFit {
  static late double rpx;
  static late double rpxH;
  static void initialize() {
    // if ((rpx) > 0) {
    //   return;
    // }
    rpx = ZzScreen().screenWidth / 375;
    rpxH = ZzScreen().screenHeight / 667;
  }
}

extension DoubleFit on double {
  double get rpx {
    HYSizeFit.initialize();
    if (Platform.isIOS) {
      return (HYSizeFit.rpx * this * 1.1).toDouble();
    } else {
      return (HYSizeFit.rpx * this).toDouble();
    }
  }

  double get rpxH {
    HYSizeFit.initialize();
    if (Platform.isIOS) {
      return (HYSizeFit.rpxH * this * 1.1).toDouble();
    } else {
      return (HYSizeFit.rpxH * this).toDouble();
    }
  }
}
