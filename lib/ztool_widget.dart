import 'package:flutter/material.dart';
import 'package:ztool/ztool.dart';

Widget inputWidget(
  BuildContext context,
  Widget child,
) {
  return InkWell(
    onTap: () {
      FocusScope.of(context).requestFocus(FocusNode()); // 触摸收起键盘
    },
    child: Container(
      color: ZzColor.pageBackGround, //解决Android不设背景色,删除输入框文字背景会置灰
      child: child,
    ),
  );
}
