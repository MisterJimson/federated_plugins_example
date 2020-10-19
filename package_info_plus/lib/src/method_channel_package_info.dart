import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package_info_platform_interface.dart';

const MethodChannel _channel = MethodChannel('plugins.flutter.io/package_info');

/// An implementation of [PackageInfoPlatform] that uses method channels.
class MethodChannelPackageInfo extends PackageInfoPlatform {
  @override
  Future<PackageInfo> getAll() async {
    final Map<String, dynamic> map =
        await _channel.invokeMapMethod<String, dynamic>('getAll');
    return PackageInfo(
      appName: map["appName"],
      packageName: map["packageName"],
      version: map["version"],
      buildNumber: map["buildNumber"],
    );
  }
}
