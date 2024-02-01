import 'package:flutter/material.dart';

//颜色常量
class ZzColor {
  ///判断一个颜色是否是亮色 用来判断反色
  static bool isLightColor(Color color) {
    double darkness =
        0.299 * color.red + 0.587 * color.green + 0.114 * color.blue;
    return darkness >= 192;
  }

  static Color mainAppColor = const Color(0xFFFF4800);
  static const Color clearColor = Color.fromRGBO(0, 0, 0, 0);
  static const Color whiteColor = Colors.white;
  static const Color pageBackGround = Color(0xFFF5F6F9);
  static const Color pageBackGrounds = Color.fromARGB(71, 242, 243, 247);
  static const Color blackColor = Color(0xFF000000);
  static const Color color_111111 = Color(0xFF111111);
  static const Color color_333333 = Color(0xff333333);
  static const Color color_666666 = Color(0xff666666);
  static const Color color_888888 = Color(0xff888888);
  static const Color color_999999 = Color(0xff999999);
  static const Color colorToF5F6FA = Color(0xFFF5F6FA);

  static const Color color_0A81DE = Color(0xFF0A81DE);
  static const Color colorToF8EDFD = Color(0xFFF8EDFD);
  static const Color colorTo434DBC = Color(0xFF434DBC);
  static const Color colorToB37AFB = Color(0xFFB37AFB);
  static const Color colorToBBBBBB = Color(0xFFBBBBBB);
  static const Color colorToE0E0E0 = Color(0xffE0E0E0);
  static const Color colorToD9B0FE = Color(0xFFD9B0FE);
  static const Color colorToFAE3FF = Color(0xFFFAE3FF);
  static const Color colorToB57CFE = Color(0xFFB57CFE);
  static const Color colorToF5FAFD = Color(0xFFF5FAFD);
  static const Color colorToFEF5F6 = Color(0xFFFEF5F6);
  static const Color colorToFEFBF6 = Color(0xFFFEFBF6);
  static const Color colorToF1FFF4 = Color(0xFFF1FFF4);
  static const Color colorToF2F2F2 = Color(0xFFF2F2F2);
  static const Color colorToFEFEFE = Color(0xFFFEFEFE);

  static const Color colorToFFF2EA = Color(0xFFFFF2EA);
  static const Color colorToFBE9E9 = Color(0xFFFBE9E9);
  static const Color colorToFBEAF2 = Color(0xFFFBEAF2);

  static const Color colorToF6EDEB = Color(0xFFF6EDEB);
  static const Color colorToF1993D = Color(0xFFF1993D);
  static const Color colorToF2B06A = Color(0xFFF2B06A);
  static const Color colorToFFFB8967 = Color(0xFFFB8967);

  static const Color colorToFFF1EB = Color(0xFFFFF1EB);
  static const Color lineColor = Color(0xFFF4F5F9);
  static const Color colorToE94A18 = Color(0xFFE94A18);
  static const Color colorToD9464E = Color(0xFFD9464E);
  static const Color colorToE17379 = Color(0xFFE17379);

  static const Color colorToCD4B7B = Color(0xFFCD4B7B);
  static const Color colorToF2C140 = Color(0xFFF2C140);

  static const Color colorToFF4D6D = Color(0xFFFF4D6D);
  static const Color colorToE82B2B = Color(0xFFE82B2B);
  static const Color colorToFF1F1F = Color(0xFFFF1F1F);
  static const Color colorToF3F3F3 = Color(0xFFF3F3F3);
  static const Color colorToF8EDFD60 = Color.fromARGB(60, 248, 237, 253);
  static const Color colorToF3F3F360 = Color.fromARGB(60, 243, 243, 243);

  static const Color color_595758 = Color(0xFF595758);
  static const Color color_636B70 = Color(0xFF636B70);
  static const Color customGreenColor = Color(0xFF35C08B);
  static const Color colorToE5FBEF = Color(0xFFE5FBEF);
  static const Color color_93A1AA = Color(0xFF93A1AA);
  static const Color color_4D31B683 = Color(0x4D31B683);
  static const Color color_1C507061 = Color(0x1C507061); //阴影色
  static const Color colorToD8D8D8 = Color(0xD8D8D8); //浅色下划线
  static const Color color_9DAAB2 = Color(0x9DAAB2); //深色下划线
//
  static const Color color_FFF77700 = Color(0xFFF77700);

  static const Color color_FFFFDC34 = Color(0xFFFFDC34); //订单冻结色
  static const Color color_FFf0f0f0 = Color(0xFFf0f0f0); //订单状态背景色
  static const Color color_FFFFDEC6 = Color(0xFFFFDEC6); //订单状态背景色
  static const Color color_FFE5FBEF = Color(0xFFE5FBEF); //订单状态背景色
  static const Color color_FF93a1aa = Color(0xFF93a1aa); //订单状态文字色
  static const Color color_FFBC620F = Color(0xFFBC620F); //订单状态文字色
  static const Color color_FF93A1AA = Color(0xFF93A1AA); //订单已取消时间颜色
  static const Color color_F9E8FD = Color(0xFFF9E8FD); //订单申请取消的背景颜色
  static const Color color_AC64BC = Color(0xFFAC64BC); //订单申请取消的文字颜色
  static const Color color_141414 = Color(0xFF141414); //提示框title颜色
  static const Color color_FFEEEEEE = Color(0xFFEEEEEE); //提示框title颜色
  static const Color color_FFD5EFE5 = Color(0xFFD5EFE5); //订单详情虚线颜色
  static const Color color_FFFFDD3E = Color(0xFFFFDD3E); //订单详情虚线颜色
  static const Color color_FFDADADA = Color(0xFFDADADA); //订单详情虚线颜色

  // 首页已被接单置灰色
  // ignore: constant_identifier_names
  static const Color color_A6A8A7 = Color(0xFFA6A8A7);
  //分割线颜色
  // ignore: constant_identifier_names
  static const Color color_EAEAEAFF = Color(0xEAEAEAFF);
  // ignore: constant_identifier_names
  static const Color color_33E2E2E2 = Color(0x33E2E2E2);
  // ignore: constant_identifier_names
  static const Color colorToFFE7E9FD = Color(0xFFE7E9FD);
  // ignore: constant_identifier_names
  static const Color colorToFF714DA6 = Color(0xFF714DA6);
  // ignore: constant_identifier_names
  static const Color color_FFFFF2E7 = Color(0xFFFFF2E7);
  // ignore: constant_identifier_names
  static const Color color_FFEF7D24 = Color(0xFFEF7D24);
  static const Color color_FFA6A8A7 = Color(0xFFA6A8A7);
  static const Color color_FFFB4C4C = Color(0xFFFB4C4C);

  static const Color color_FFF7F7F7 = Color(0xFFF7F7F7);
  static const Color color_FFD7DADC = Color(0xFFD7DADC);
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
