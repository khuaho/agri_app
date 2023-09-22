import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

class DeviceInfoHelper {
  static Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      return webInfo.vendor!.toString() +
          webInfo.userAgent.toString() +
          webInfo.hardwareConcurrency.toString();
    } else {
      if (Platform.isAndroid) {
        const androidIdPlugin = AndroidId();
        return await androidIdPlugin.getId();
      } else if (Platform.isIOS) {
        final iosDeviceInfo = await deviceInfo.iosInfo;
        return iosDeviceInfo.identifierForVendor;
      } else {
        throw Exception('Unknown platform');
      }
    }
  }

  static Future<String?> getOSName() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      return webInfo.browserName.name;
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        return Platform.operatingSystem;
      } else {
        throw Exception('Unknown platform');
      }
    }
  }

  static Future<String?> getOSVersion() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      WebBrowserInfo webInfo = await deviceInfo.webBrowserInfo;
      return webInfo.appVersion;
    } else {
      if (Platform.isAndroid || Platform.isIOS) {
        return Platform.operatingSystemVersion;
      } else {
        throw Exception('Unknown platform');
      }
    }
  }
}
