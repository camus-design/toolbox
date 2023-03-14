extension StringExtension on String {
  // toCharacterBreakString
  String toCharacterBreakString() {
    if (isEmpty) {
      return this;
    }
    return runes.map(String.fromCharCode).join('\u{200B}');
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
