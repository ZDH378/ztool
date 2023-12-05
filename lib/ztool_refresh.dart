import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ztool/ztool_color.dart';
import 'package:ztool/ztool_fonts.dart';

//通用Refresh样式
const MaterialClassicHeader smartHeader =
    MaterialClassicHeader(color: ZzColor.mainAppColor);

class ZzRefresh extends StatefulWidget {
  final VoidCallback? onRefresh;
  final VoidCallback? onLoading;
  final RefreshController refreshController;
  final Widget child;
  const ZzRefresh(
      {super.key,
      required this.refreshController,
      this.onRefresh,
      this.onLoading,
      required this.child});

  @override
  State<ZzRefresh> createState() => _ZzRefreshState();
}

class _ZzRefreshState extends State<ZzRefresh> {
  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      header: smartHeader,
      footer: CustomFooter(builder: (context, status) {
        switch (status) {
          case LoadStatus.loading:
            return Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child: Text(
                "加载中...",
                style: ZzFonts.fontMedium666(14),
              ),
            );
          case LoadStatus.noMore:
            return Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child: Text(
                "已加载完毕",
                style: ZzFonts.fontMedium666(14),
              ),
            );
          case LoadStatus.failed:
            return Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child: Text(
                "数据迷鹿了",
                style: ZzFonts.fontMedium666(14),
              ),
            );

          default:
            return Container(
              padding: const EdgeInsets.only(top: 20),
              alignment: Alignment.bottomCenter,
              child: Text(
                "向上滑动加载更多",
                style: ZzFonts.fontMedium666(14),
              ),
            );
        }
      }),
      enablePullUp: widget.onLoading != null ? true : false,
      enablePullDown: widget.onRefresh != null ? true : false,
      controller: widget.refreshController,
      child: widget.child,
    );
  }
}
