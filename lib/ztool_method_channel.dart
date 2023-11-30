import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ztool_platform_interface.dart';

/// An implementation of [ZToolPlatform] that uses method channels.
class MethodChannelZTool extends ZToolPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ztool');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
