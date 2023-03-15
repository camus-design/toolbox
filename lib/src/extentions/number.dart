/// Extends the [num] with additional functionality.
extension NumberExtension on num {
  /// Returns a string representation of this number with the given [length].
  String padLeftNumber(num number, int length, {String pad = '0'}) {
    return number.toString().padLeft(length, pad);
  }

  /// Returns true if this number is between [min] and [max] (inclusive).
  bool isBetween(num min, num max) {
    return this >= min && this <= max;
  }
}
