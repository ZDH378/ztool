import 'package:flutter/material.dart';
import 'ztool.dart';

//字体常量
class ZzFonts {
  static TextStyle fontByBase(double size, Color color, FontWeight weight) =>
      TextStyle(fontSize: size, fontWeight: weight, color: color);
  static TextStyle fontBold111(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.color_111111);
  static TextStyle fontMedium111(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.color_111111);
  static TextStyle fontNormal111(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.color_111111);
  static TextStyle fontBold333(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.color_333333);
  static TextStyle fontMedium333(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.color_333333);
  static TextStyle fontNormal333(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.color_333333);
  static TextStyle fontBold666(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.color_666666);
  static TextStyle fontMedium666(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.color_666666);
  static TextStyle fontNormal666(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.color_666666);
  static TextStyle fontBold999(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.color_999999);
  static TextStyle fontMedium999(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.color_999999);
  static TextStyle fontNormal999(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.color_999999);
  static TextStyle fontBoldAFB(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
      color: ZzColor.colorToB37AFB);
  static TextStyle fontMediumAFB(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: ZzColor.colorToB37AFB);

  static TextStyle fontNormalAFB(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.colorToB37AFB);
  static TextStyle fontHeavyWhite(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w900, color: ZzColor.whiteColor);
  static TextStyle fontBoldWhite(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.whiteColor);
  static TextStyle fontMediumWhite(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.whiteColor);
  static TextStyle fontNormalWhite(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.normal, color: ZzColor.whiteColor);
  static TextStyle fontHeavy4800(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w900, color: ZzColor.mainAppColor);
  static TextStyle fontBold4800(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.bold, color: ZzColor.mainAppColor);
  static TextStyle fontMedium4800(double size) => TextStyle(
      fontSize: size, fontWeight: FontWeight.w600, color: ZzColor.mainAppColor);
  static TextStyle fontNormal4800(double size) => TextStyle(
      fontSize: size,
      fontWeight: FontWeight.normal,
      color: ZzColor.mainAppColor);
}
