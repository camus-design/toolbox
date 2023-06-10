import 'dart:async';

/// Creates and returns a throttled version of the provided function [callback].
///
/// The throttled function will only be executed at most once within the
/// specified [milliseconds]. Subsequent calls within the delay period will be ignored.
///
/// The [callback] parameter is the function to throttle.
/// The [milliseconds] parameter sets the time to wait before allowing the next function call.
///
/// Example usage:
///
/// ```dart
/// final throttledPrint = camusThrottle(
///    () => print('Throttled function called.'),
///    milliseconds: 300,
///  );
///
/// throttledPrint();
/// ```
Function camusThrottle(Function() callback, {required int milliseconds}) {
  Timer? timer;
  bool allowCall = true;

  void throttledFunction() {
    if (!allowCall) {
      return;
    }

    allowCall = false;
    callback();

    timer?.cancel();
    timer = Timer(
      Duration(milliseconds: milliseconds),
      () => allowCall = true,
    );
  }

  return throttledFunction;
}
