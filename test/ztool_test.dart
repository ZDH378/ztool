import 'package:flutter_test/flutter_test.dart';
import 'package:ztool/ztool.dart';
import 'package:ztool/ztool_platform_interface.dart';
import 'package:ztool/ztool_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockZToolPlatform
    with MockPlatformInterfaceMixin
    implements ZToolPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ZToolPlatform initialPlatform = ZToolPlatform.instance;

  test('$MethodChannelZTool is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelZTool>());
  });

  test('getPlatformVersion', () async {
    ZTool zToolPlugin = ZTool();
    MockZToolPlatform fakePlatform = MockZToolPlatform();
    ZToolPlatform.instance = fakePlatform;

    expect(await zToolPlugin.getPlatformVersion(), '42');
  });
}
