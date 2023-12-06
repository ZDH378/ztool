// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'ztool_platform_interface.dart';
export 'ztool_color.dart';
export 'ztool_fonts.dart';
export 'ztool_decoration.dart';
export 'ztool_date.dart';
export 'ztool_string.dart';
export 'ztool_screen.dart';
export 'ztool_toast.dart';
export 'ztool_loading.dart';
export 'ztool_widget.dart';
export 'ztool_safe.dart';
export 'ztool_image.dart';
export 'ztool_gomap.dart';
export 'ztool_refresh.dart';
export 'ztool_popup.dart';
export 'ztool_counter.dart';
export 'package:ztool/load_animation_widget/ztool_loadanimation.dart';
export 'ztool_permission.dart';

class ZTool {
  Future<String?> getPlatformVersion() {
    return ZToolPlatform.instance.getPlatformVersion();
  }

  static inittools() async {}
}
