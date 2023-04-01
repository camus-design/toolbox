import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

/// A singleton class for retrieving device information.
///
/// This class provides a simple interface for getting device information such as
/// the device ID. It is implemented as a singleton to ensure that only one instance
/// of the [DeviceInfoPlugin] is created.
///
/// Example usage:
///
/// ```dart
/// final deviceInfo = CamusDeviceInfo();
/// final data = await deviceInfo.data;
/// print('Device ID: ${data.deviceId}');
/// ```
class CamusDeviceInfo {
  /// Creates a new instance of [CamusDeviceInfo] or returns an existing one.
  ///
  /// This class is implemented as a singleton, so this constructor will either create
  /// a new instance or return an existing one.
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

  /// Retrieves the device information.
  ///
  /// Returns a [Future] that will complete with the [DeviceInfoModel] once the
  /// information is retrieved.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// final deviceInfo = await CamusDeviceInfo().data;
  /// final deviceId = deviceInfo.deviceId;
  /// ```
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

/// A model representing device information.
///
/// This class represents device information such as the device ID.
class DeviceInfoModel {
  /// Creates a new instance of [DeviceInfoModel] with the specified [deviceId].
  const DeviceInfoModel({
    required this.deviceId,
  });

  /// The device ID.
  final String deviceId;
}
