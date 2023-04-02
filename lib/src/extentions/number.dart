/// Extension that provides additional methods to work with numbers.
extension NumberExtension on num {
  /// Returns a string representation of this number with the given [length].
  ///
  /// If this number is shorter than [length], it will be padded with the [pad] character
  /// (defaults to '0') to match the specified length.
  ///
  /// Example:
  /// ```dart
  /// print(2.padLeftNumber(3)); // '002'
  /// ```
  String padLeftNumber(int length, {String pad = '0'}) {
    return toString().padLeft(length, pad);
  }

  /// Returns `true` if this number is between [min] and [max] (inclusive).
  ///
  /// Example:
  /// ```dart
  /// print(5.isBetween(1, 10)); // true
  /// print(5.isBetween(10, 20)); // false
  /// ```
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }
}
