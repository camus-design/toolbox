import 'package:device_info_plus/device_info_plus.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';
import 'package:universal_platform/universal_platform.dart';


class MockDeviceInfoPlugin extends Mock implements DeviceInfoPlugin {}

class MockAndroidDeviceInfo extends Mock implements AndroidDeviceInfo {}

class MockIosDeviceInfo extends Mock implements IosDeviceInfo {}

class MockMacOsDeviceInfo extends Mock implements MacOsDeviceInfo {}

class MockLinuxDeviceInfo extends Mock implements LinuxDeviceInfo {}

class MockWindowsDeviceInfo extends Mock implements WindowsDeviceInfo {}

class MockWebBrowserInfo extends Mock implements WebBrowserInfo {}

void main() {
  group('CamusDeviceInfo', () {
    late DeviceInfoPlugin deviceInfoPlugin;
    late CamusDeviceInfo camusDeviceInfo;

    setUp(() {
      deviceInfoPlugin = MockDeviceInfoPlugin();
      camusDeviceInfo = CamusDeviceInfo();
    });

    test('returns cached device info', () async {
      camusDeviceInfo._cachedDeviceInfo = DeviceInfoModel(deviceId: 'cached_device_id');
      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('cached_device_id'));
    });

    test('retrieves Android device info', () async {
      when(deviceInfoPlugin.androidInfo)
          .thenAnswer((_) async => MockAndroidDeviceInfo()..id = 'android_device_id');

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('android_device_id'));
    });

    test('retrieves iOS device info', () async {
      when(deviceInfoPlugin.iosInfo)
          .thenAnswer((_) async => MockIosDeviceInfo()..identifierForVendor = 'ios_device_id');

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('ios_device_id'));
    });

    test('retrieves macOS device info', () async {
      when(deviceInfoPlugin.macOsInfo)
          .thenAnswer((_) async => MockMacOsDeviceInfo()..systemGUID = 'macos_device_id');

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('macos_device_id'));
    });

    test('retrieves Linux device info', () async {
      when(deviceInfoPlugin.linuxInfo)
          .thenAnswer((_) async => MockLinuxDeviceInfo()..machineId = 'linux_device_id');

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('linux_device_id'));
    });

    test('retrieves Windows device info', () async {
      when(deviceInfoPlugin.windowsInfo)
          .thenAnswer((_) async => MockWindowsDeviceInfo()..computerName = 'windows_device_id');

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('windows_device_id'));
    });

    test('retrieves web browser info', () async {
      when(deviceInfoPlugin.webBrowserInfo)
          .thenAnswer((_) async => MockWebBrowserInfo()..browserName = BrowserName('chrome'));

      final data = await camusDeviceInfo.data;
      expect(data.deviceId, equals('chrome'));
    });

    test('throws exception for unsupported platform', () async {
      when(UniversalPlatform.isAndroid).thenReturn(false);
      when(UniversalPlatform.isIOS).thenReturn(false);
      when(UniversalPlatform.isMacOS).thenReturn(false);
      when(UniversalPlatform.isLinux).thenReturn(false);
      when(UniversalPlatform.isWindows).thenReturn(false);
      when(UniversalPlatform.is
