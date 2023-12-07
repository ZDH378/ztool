import 'package:flutter/material.dart';
import 'package:ztool/ztool_color.dart';

class ZzAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final String? subtitle; //副标题
  final Color? backColor; //副标题
  final bool? isFirstVC; //是否是一级界面
  final double? elevation; //是否要下划线
  final Widget? rightIcon; //右侧按钮icon
  final VoidCallback? onRightTap;
  final VoidCallback? onLeftTap;

  ZzAppBar(
      {super.key,
      required this.title,
      this.onRightTap,
      this.subtitle,
      this.isFirstVC,
      this.rightIcon,
      this.onLeftTap,
      this.elevation,
      this.backColor});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // 自定义AppBar的高度

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: null,
      automaticallyImplyLeading: false,
      backgroundColor: backColor ?? ZzColor.mainAppColor,
      // pinned: true,
      elevation: elevation ?? 0.01,
      primary: true,
      // floating: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              width: 80,
              height: 80,
              child: isFirstVC != true
                  ? InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        if (onLeftTap != null) {
                          onLeftTap!();
                        } else {
                          if (Navigator.of(context).canPop()) {
                            Navigator.of(context).pop();
                          }
                          return;
                        }
                      },
                      child: SizedBox(
                        width: 80,
                        height: 80,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Image(
                            image: const AssetImage(
                                'assets/icons/const_nav_back.png'),
                            width: 18,
                            height: 18,
                            color: ZzColor.isLightColor(
                                    backColor ?? ZzColor.mainAppColor)
                                ? ZzColor.blackColor
                                : ZzColor.whiteColor,
                          ),
                        ),
                      ))
                  : Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: avoid_unnecessary_containers
              Container(
                child: Text(
                  title ?? "",
                  style: ZzColor.isLightColor(backColor ?? ZzColor.mainAppColor)
                      ? const TextStyle(
                          color: ZzColor.color_111111,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )
                      : const TextStyle(
                          color: ZzColor.whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                ),
              ),
              subtitle?.isNotEmpty == true
                  ? Text(
                      subtitle ?? "",
                      style: const TextStyle(
                        color: Color(0xFF8695B2),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  : Container()
            ],
          ),
          // ignore: avoid_unnecessary_containers
          SizedBox(
            width: 80,
            height: 80,
            child: rightIcon != null
                ? InkWell(
                    highlightColor: Colors.transparent,
                    onTap: () => onRightTap!(),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: rightIcon,
                      ),
                    ))
                : Container(),
          ),
        ],
      ),
    );
  }
}
