String camusDateFormatDistance(
  DateTime dirtyDate, {
  DateTime? dirtyBaseDate,
  String suffix = 'ago',
  String locale = 'en',
}) {
  // TODO(nepaul): Add support for other locales
  if (locale != 'en') {
    throw ArgumentError('Locale $locale is not supported');
  }

  final DateTime baseDate = dirtyBaseDate ?? DateTime.now();
  final Duration diff = baseDate.difference(dirtyDate);
  String formatStr = '';
  if (diff.inDays > 365) {
    formatStr = '${diff.inDays ~/ 365}y';
  } else if (diff.inDays > 30) {
    formatStr = '${diff.inDays ~/ 30}m';
  } else if (diff.inDays > 0) {
    formatStr = '${diff.inDays}d';
  } else if (diff.inHours > 0) {
    formatStr = '${diff.inHours}h';
  } else if (diff.inMinutes > 0) {
    formatStr = '${diff.inMinutes}m';
  } else if (diff.inSeconds > 0) {
    formatStr = '${diff.inSeconds}s';
  } else {
    formatStr = '1s $suffix';
  }

  if (suffix.isNotEmpty) {
    formatStr += ' $suffix';
  }

  return formatStr;
}
