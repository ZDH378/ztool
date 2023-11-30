import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ztool_method_channel.dart';

abstract class ZToolPlatform extends PlatformInterface {
  /// Constructs a ZToolPlatform.
  ZToolPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZToolPlatform _instance = MethodChannelZTool();

  /// The default instance of [ZToolPlatform] to use.
  ///
  /// Defaults to [MethodChannelZTool].
  static ZToolPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZToolPlatform] when
  /// they register themselves.
  static set instance(ZToolPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
