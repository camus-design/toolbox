/// Returns true if [value] is not null and is not empty.
///
/// If [value] is a String, this function checks whether it has a non-zero length.
/// If [value] is a List, Set, or Map, this function checks whether it has a non-zero length.
/// If [value] is any other type, this function simply checks whether it is not null.
bool isNotNullOrEmpty(dynamic value) {
  if (value == null) {
    return false;
  }
  if (value is String || value is List || value is Set || value is Map) {
    return value.isNotEmpty;
  }
  return true;
}

/// Returns true if [value] is null or empty.
///
/// If [value] is a String, this function checks whether it has a zero length.
/// If [value] is a List, Set, or Map, this function checks whether it has a zero length.
/// If [value] is any other type, this function simply checks whether it is null.
bool isNullOrEmpty(dynamic value) => !isNotNullOrEmpty(value);
