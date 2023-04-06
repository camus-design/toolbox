/// Extension methods for the `String` class.
extension StringExtension on String {
  /// Returns the reversed version of the string.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'hello'.reverse(); // returns 'olleh'
  /// ```
  String reverse() {
    return String.fromCharCodes(runes.toList().reversed);
  }

  /// Returns `true` if the string represents a number.
  ///
  /// Example:
  ///
  /// ```dart
  /// '123'.isNumber(); // returns true
  /// 'abc'.isNumber(); // returns false
  /// ```
  bool isNumber() {
    return double.tryParse(this) != null;
  }

  /// Returns `true` if the string represents a digit.
  ///
  /// Example:
  ///
  /// ```dart
  /// '1'.isDigit(); // returns true
  /// 'a'.isDigit(); // returns false
  /// ```
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

  /// Adds the given character at the specified position.
  ///
  /// If `repeat` is `false`, the character is added only once at the specified
  /// position. Otherwise, the character is repeatedly added at every `position`
  /// index of the string.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'hello'.addCharAtPosition('*', 2); // returns 'he*llo'
  /// 'hello'.addCharAtPosition('*', 2, repeat: true); // returns 'he*l*l*o'
  /// ```
  ///
  /// Throws an `AssertionError` if `position` is out of range.
  String addCharAtPosition(
    String char,
    int position, {
    bool repeat = false,
  }) {
    assert(position < length && position >= 0);

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

  /// Returns the string with zero-width space characters between each character.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'hello'.toCharacterBreakString(); // returns 'h​e​l​l​o'
  /// ```
  String toCharacterBreakString() {
    if (isEmpty) {
      return this;
    }
    return runes.map(String.fromCharCode).join('\u{200B}');
  }

  /// Returns the string with the first character capitalized.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'hello'.capitalize(); // returns 'Hello'
  /// ```
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Splits the string into chunks of the specified size.
  ///
  /// Example:
  ///
  /// ```dart
  /// 'hello world'.toChunks(3); // returns ['hel', 'lo ', 'wor', 'ld']
  List<String> toChunks(int size) {
    if (isEmpty) {
      return <String>[''];
    }
    final List<String> chunks = <String>[];
    for (int i = 0; i < length; i += size) {
      final int end = i + size >= length ? length : i + size;
      chunks.add(substring(i, end));
    }
    return chunks;
  }
}
