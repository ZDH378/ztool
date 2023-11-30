import 'package:flutter/material.dart';
import 'package:ztool/ztool.dart';

class ZzPopupView {
  static void showPopupViewOfIOS(BuildContext context,
      {String? title,
      bool? barrierDismissible,
      Widget? child,
      Widget? cutomTitle, //如果传入自定义title视图 title则失效
      String? leftBtnTitle,
      String? rightBtnTitle,
      Color? leftBtnTextColor,
      Color? rightBtnTextColor,
      VoidCallback? onRightBtnCallBack,
      VoidCallback? onLeftBtnCallBack}) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible ?? true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return ZzPopupOfIOS(
                title: title,
                cutomTitle: cutomTitle,
                leftBtnTitle: leftBtnTitle,
                leftBtnTextColor: leftBtnTextColor,
                rightBtnTextColor: rightBtnTextColor,
                rightBtnTitle: rightBtnTitle,
                onLeftBtnCallBack: onLeftBtnCallBack,
                onRightBtnCallBack: onRightBtnCallBack,
                child: child,
              );
            },
          );
        });
  }
}

//ios风格弹出组件
class ZzPopupOfIOS extends StatefulWidget {
  final VoidCallback? onRightBtnCallBack;
  final VoidCallback? onLeftBtnCallBack;
  final String? title;
  final Widget? child;
  final Widget? cutomTitle;
  final String? leftBtnTitle;
  final String? rightBtnTitle;
  final Color? leftBtnTextColor;
  final Color? rightBtnTextColor;

  const ZzPopupOfIOS({
    super.key,
    this.title,
    this.onRightBtnCallBack,
    this.onLeftBtnCallBack,
    this.child,
    this.leftBtnTitle,
    this.rightBtnTitle,
    this.leftBtnTextColor,
    this.rightBtnTextColor,
    this.cutomTitle,
  });

  @override
  State<ZzPopupOfIOS> createState() => _ZzPopupOfIOSState();
}

class _ZzPopupOfIOSState extends State<ZzPopupOfIOS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: ZzColor.whiteColor,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: //标题视图
          ($notempty(widget.title) || widget.cutomTitle != null)
              ? Padding(
                  padding: const EdgeInsets.only(
                      top: 25, bottom: 30, left: 30, right: 30),
                  child: widget.cutomTitle != null
                      ? widget.cutomTitle ?? Container()
                      : Center(
                          child: Text(
                            widget.title ?? "",
                            style: ZzFonts.fontBold333(18),
                          ),
                        ),
                )
              : Container(),
      titlePadding: EdgeInsets.zero,
      content: Container(
        constraints: BoxConstraints(
          minHeight: 50, // 设置最小高度
          maxHeight: ZzScreen().screenHeight / 10 * 4, // 设置最大高度
        ),
        decoration: ZzDecoration.onlyradius(10, ZzColor.whiteColor),
        width: ZzScreen().screenWidth - 60,
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.child != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 35),
                      child: widget.child ?? Container())
                  : Container(),
            ],
          ),
        ),
      ),
      alignment: Alignment.center,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        const Divider(
          height: 1,
          color: ZzColor.lineColor,
        ),
        Row(
          children: [
            Expanded(
                child: InkWell(
              onTap: () {
                if (widget.onLeftBtnCallBack != null) {
                  widget.onLeftBtnCallBack!();
                }
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                  return;
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  widget.leftBtnTitle ?? "取消",
                  style: ZzFonts.fontByBase(
                      14,
                      widget.leftBtnTextColor ?? ZzColor.color_666666,
                      FontWeight.bold),
                ),
              ),
            )),
            const SizedBox(
              height: 30,
              child: VerticalDivider(
                thickness: 1.3,
                color: ZzColor.lineColor,
              ),
            ),
            Expanded(
                child: InkWell(
              onTap: () {
                if (widget.onRightBtnCallBack != null) {
                  widget.onRightBtnCallBack!();
                }
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                  return;
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  widget.rightBtnTitle ?? "确认",
                  style: ZzFonts.fontByBase(
                      14,
                      widget.rightBtnTextColor ?? ZzColor.mainAppColor,
                      FontWeight.bold),
                ),
              ),
            ))
          ],
        )
      ],
      actionsPadding: EdgeInsets.zero,
    );
  }
}
