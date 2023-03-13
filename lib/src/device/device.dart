import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

class CamusDeviceInfo {
  factory CamusDeviceInfo() {
    _singleton ??= CamusDeviceInfo._();
    return _singleton!;
  }

  CamusDeviceInfo._() {
    _deviceInfoPlugin = DeviceInfoPlugin();
  }

  late DeviceInfoPlugin _deviceInfoPlugin;
  DeviceInfoModel? _cachedDeviceInfo;
  static CamusDeviceInfo? _singleton;

  Future<DeviceInfoModel> get data async {
    if (_cachedDeviceInfo != null) {
      return _cachedDeviceInfo!;
    }

    if (UniversalPlatform.isMacOS) {
      final MacOsDeviceInfo macOsDeviceInfo = await _deviceInfoPlugin.macOsInfo;
      _cachedDeviceInfo =
          DeviceInfoModel(deviceId: macOsDeviceInfo.systemGUID ?? '');
      return _cachedDeviceInfo!;
    }
    if (UniversalPlatform.isAndroid) {
      final AndroidDeviceInfo androidDeviceInfo =
          await _deviceInfoPlugin.androidInfo;
      _cachedDeviceInfo = DeviceInfoModel(deviceId: androidDeviceInfo.id);
      return _cachedDeviceInfo!;
    }
    if (UniversalPlatform.isIOS) {
      final IosDeviceInfo iosDeviceInfo = await _deviceInfoPlugin.iosInfo;
      _cachedDeviceInfo =
          DeviceInfoModel(deviceId: iosDeviceInfo.identifierForVendor ?? '');
      return _cachedDeviceInfo!;
    }
    if (UniversalPlatform.isLinux) {
      final LinuxDeviceInfo linuxDeviceInfo = await _deviceInfoPlugin.linuxInfo;
      _cachedDeviceInfo =
          DeviceInfoModel(deviceId: linuxDeviceInfo.machineId ?? '');
      return _cachedDeviceInfo!;
    }
    if (UniversalPlatform.isWindows) {
      final WindowsDeviceInfo windowsDeviceInfo =
          await _deviceInfoPlugin.windowsInfo;
      _cachedDeviceInfo =
          DeviceInfoModel(deviceId: windowsDeviceInfo.computerName);
      return _cachedDeviceInfo!;
    }
    if (UniversalPlatform.isWeb) {
      final WebBrowserInfo webDeviceInfo =
          await _deviceInfoPlugin.webBrowserInfo;
      _cachedDeviceInfo =
          DeviceInfoModel(deviceId: webDeviceInfo.browserName.name);
    }

    throw Exception('Unsupported platform');
  }
}

class DeviceInfoModel {
  DeviceInfoModel({
    required this.deviceId,
  });

  final String deviceId;
}
