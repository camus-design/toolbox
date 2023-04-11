import 'dart:async';

/// Creates and returns a debounced version of the provided function [callback].
///
/// The debounced function will only be executed if no new calls are made within
/// the specified [milliseconds]. Each new call resets the timer.
///
/// The [callback] parameter is the function to debounce.
/// The [milliseconds] parameter sets the time to wait before actually
/// executing the function call.
///
/// Example usage:
///
/// ```dart
/// final debouncedPrint = camusDebounce(
///   () => print('Debounced function called.'),
///   milliseconds: 1000,
/// );
///
/// debouncedPrint();
/// ```
Function camusDebounce(Function() callback, {required int milliseconds}) {
  Timer? timer;

  void debouncedFunction() {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), callback);
  }

  return debouncedFunction;
}
