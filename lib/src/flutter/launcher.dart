import 'package:url_launcher/url_launcher.dart';

/// A utility class for launching phone calls and URLs.
class CamusLauncher {
  /// Launches a phone call with the given phone number.
  ///
  /// Throws an exception if the phone call could not be launched.
  ///
  /// Example:
  /// ```dart
  /// await CamusLauncher.launchPhoneCall('1234567890');
  /// ```
  static Future<void> launchPhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  /// Opens a URL with the given [url] string.
  ///
  /// Throws an exception if the URL could not be launched.
  ///
  /// Example:
  /// ```dart
  /// await CamusLauncher.openUrl('https://www.example.com');
  /// ```
  static Future<void> openUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
