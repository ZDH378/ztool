import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ztool/ztool.dart';

//安全加载图片.使用cached_network_image实现
Widget zZNetImage(String imageUrl,
    {Widget? placeholder,
    Widget? errorWidget,
    BoxFit? fit,
    Color? backgroundColor,
    Color? valueColor}) {
  return imageUrl.isNotEmpty
      ? CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit ?? BoxFit.cover,
          placeholder: (context, url) =>
              placeholder ??
              Center(
                child: SizedBox(
                  width: 30.0, // 设置指示器的宽度
                  height: 30.0, // 设置指示器的高度
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0, // 设置指示器的线宽度
                    backgroundColor:
                        backgroundColor ?? ZzColor.colorToFFF1EB, // 设置指示器的背景颜色
                    valueColor: AlwaysStoppedAnimation<Color>(
                        valueColor ?? ZzColor.mainAppColor), // 设置指示器的颜色
                  ),
                ),
              ), // 加载时显示的占位符
          errorWidget: (context, url, error) =>
              errorWidget ??
              const Center(
                  child: Image(
                width: 62,
                height: 62,
                image: AssetImage(
                  "assets/images/icon_images_placeholder.png",
                  package: "ztool",
                ),
              )), // 加载失败时显示的小部件
        )
      : placeholder ??
          const Center(
              child: Image(
                  width: 62,
                  height: 62,
                  image: AssetImage(
                    "assets/images/icon_images_placeholder.png",
                    package: "ztool",
                  )));
}
