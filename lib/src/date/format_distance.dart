const Map<String, List<String>> _locales = <String, List<String>>{
  'en': <String>['ago', 'y', 'm', 'd', 'h', 'm', 's'],
  'fr': <String>['ago', 'an', 'mois', 'j', 'h', 'min', 's'],
  'es': <String>['ago', 'año', 'mes', 'd', 'h', 'min', 's'],
  'zh': <String>['前', '年', '个月', '天', '小时', '分钟', '秒'],
};

/// A utility function to format a [DateTime] object as a human-readable string
/// representing the elapsed time since the given date, such as "5m ago" or
/// "2d ago".
///
/// The returned string is determined by the difference between the given
/// [dirtyDate] and the [dirtyBaseDate] (or the current time if not provided),
/// and is formatted according to the given [locale]. Currently supported
/// locales are "en" (English), "fr" (French), "es" (Spanish), and "zh"
/// (Simplified Chinese).
///
/// If a [suffix] is provided, it will be appended to the end of the returned
/// string.
///
/// Example:
/// dart /// final date = DateTime.now().subtract(Duration(hours: 2));
/// final formatted = FormatDistance(date, suffix: 'ago');
/// print(formatted); // output: '2h ago'//
/// print(formattedDate); // '15m until'
String formatDistance(
  DateTime dirtyDate, {
  DateTime? dirtyBaseDate,
  String? suffix,
  String locale = 'en',
}) {
  assert(locale == 'en' || locale == 'fr' || locale == 'es' || locale == 'zh');

  final List<String> units = _locales[locale]!;

  final DateTime baseDate = dirtyBaseDate ?? DateTime.now();
  final Duration diff = baseDate.difference(dirtyDate);
  String formatStr = '';
  if (diff.inDays > 365) {
    formatStr = '${diff.inDays ~/ 365}${units[1]}';
  } else if (diff.inDays > 30) {
    formatStr = '${diff.inDays ~/ 30}${units[2]}';
  } else if (diff.inDays > 0) {
    formatStr = '${diff.inDays}${units[3]}';
  } else if (diff.inHours > 0) {
    formatStr = '${diff.inHours}${units[4]}';
  } else if (diff.inMinutes > 0) {
    formatStr = '${diff.inMinutes}${units[5]}';
  } else if (diff.inSeconds > 0) {
    formatStr = '${diff.inSeconds}${units[6]}';
  } else {
    formatStr = '1s';
  }

  if (suffix != null) {
    formatStr += ' $suffix';
  }

  return formatStr;
}
