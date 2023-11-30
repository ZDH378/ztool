import 'package:flutter/material.dart';

class ZzDecoration {
  ///仅有圆角
  static BoxDecoration onlyradius(
    double radius,
    Color color,
  ) =>
      BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      );

  static BoxDecoration shadowBDcoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 210, 207, 207).withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(0, 0), // 水平和垂直偏移量
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(10)));

  static BoxDecoration withborder(
          Color color, double borderwidth, Color bordercolor,
          {double? radius}) =>
      BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 0),
          ),
          border: Border.all(width: borderwidth, color: bordercolor));

  static BoxDecoration withgradual(List<Color> colors,
          {double? radius, AlignmentGeometry? begin, AlignmentGeometry? end}) =>
      BoxDecoration(
        gradient: LinearGradient(
          // 定义线性渐变
          colors: colors, // 渐变色列表
          begin: begin ?? Alignment.centerLeft, // 渐变起始位置
          end: end ?? Alignment.centerRight, // 渐变结束位置
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0),
        ),
      );

  // static TextStyle fontByBase(double size, Color color, FontWeight weight) =>
  //     TextStyle(fontSize: size, fontWeight: weight, color: color);
}
