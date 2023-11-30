import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:map_launcher/map_launcher.dart';

/*

ios 工程 需配置 LSApplicationQueriesSchemes
amapuri
qqmap
baidumap
amap
iosamap
*/
//显示手机里所有的地图软件
showInstallMaps(
    BuildContext context, double latitude, double longitude, String title,
    {String? description}) async {
  try {
    final coords = Coords(latitude, longitude);
    final availableMaps = await MapLauncher.installedMaps;

    // ignore: use_build_context_synchronously
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                for (var map in availableMaps)
                  InkWell(
                    onTap: () => map.showMarker(
                      coords: coords,
                      title: title,
                      description: description,
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: SvgPicture.asset(
                                        map.icon, // 替换为您的SVG图像文件路径
                                        width: 100.0, // 设置宽度
                                        height: 100.0, // 设置高度
                                      ),
                                    ),
                                    Text(_getChineaseName(map)),
                                  ],
                                ),
                                Image.asset(
                                  "assets/images/map_navigation.png",
                                  width: 40,
                                  height: 40,
                                  package: "ztool",
                                )
                              ],
                            ),
                          ),
                          const Divider()
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  } catch (e) {}
}

String _getChineaseName(AvailableMap map) {
  switch (map.mapType) {
    case MapType.amap:
      return "高德地图";
    case MapType.baidu:
      return "百度地图";
    case MapType.apple:
      return "苹果地图";
    case MapType.google:
      return "谷歌地图";
    case MapType.tencent:
      return "腾讯地图";

    default:
      return map.mapName;
  }
}
