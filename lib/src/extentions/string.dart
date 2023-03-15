/// Extends the [String] with additional functionality.
extension StringExtension on String {
  String reverse() {
    return String.fromCharCodes(runes.toList().reversed);
  }

  bool isNumber() {
    return double.tryParse(this) != null;
  }

  bool isDigit() {
    if (isEmpty) {
      return false;
    }
    if (length > 1) {
      for (final int r in runes) {
        if (r ^ 0x30 > 9) {
          return false;
        }
      }
      return true;
    }
    return runes.first ^ 0x30 <= 9;
  }

  String addCharAtPosition(
    String char,
    int position, {
    bool repeat = false,
  }) {
    assert(length < position && position >= 0);

    if (!repeat) {
      return '${substring(0, position)}$char${substring(position)}';
    }

    assert(position > 0);
    // repeat add chart at position
    final StringBuffer buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      if (i != 0 && i % position == 0) {
        buffer.write(char);
      }
      buffer.write(String.fromCharCode(runes.elementAt(i)));
    }
    return buffer.toString();
  }

  String toCharacterBreakString() {
    if (isEmpty) {
      return this;
    }
    return runes.map(String.fromCharCode).join('\u{200B}');
  }

  /// Returns a string with the first character in upper case.
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
