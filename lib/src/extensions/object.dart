import '../empty.dart' as empty;

/// Extension that provides additional methods to work with Object?.
extension ObjectExtension on Object? {

  /// Returns true if [this] is not null and is not empty.
  ///
  /// If [this] is a String, this function checks whether it has a non-zero length.
  /// If [this] is a List, Set, or Map, this function checks whether it has a non-zero length.
  /// If [this] is any other type, this function simply checks whether it is not null.
  bool isNotNullOrEmpty() => empty.isNotNullOrEmpty(this);

  /// Returns true if [this] is null or empty.
  ///
  /// If [this] is a String, this function checks whether it has a zero length.
  /// If [this] is a List, Set, or Map, this function checks whether it has a zero length.
  /// If [this] is any other type, this function simply checks whether it is null.
  bool isNullOrEmpty() => empty.isNullOrEmpty(this);
}
