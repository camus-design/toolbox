import 'dart:async';

/// A class for creating a timer that triggers a callback function at a fixed interval.
class CamusIntervalTimer {
  /// Creates a timer that triggers a callback function at a fixed interval.
  CamusIntervalTimer(this.interval, this.callback);

  /// The fixed time interval at which [callback] is called.
  final Duration interval;

  /// The function that is called at fixed time intervals.
  final void Function() callback;
  late Timer _timer;

  /// Starts the timer.
  ///
  /// Example:
  /// ```
  /// final timer = CamusIntervalTimer(Duration(seconds: 1), () {
  ///   print('Hello, world!');
  /// });
  ///
  /// timer.start();
  /// ```
  void start() {
    _timer = Timer.periodic(interval, (Timer timer) {
      callback();
    });
  }

  /// Stops the timer.
  ///
  /// Example:
  /// ```
  /// final timer = CamusIntervalTimer(Duration(seconds: 1), () {
  ///   print('Hello, world!');
  /// });
  ///
  /// timer.start();
  ///
  /// // Wait for 5 seconds
  ///
  /// timer.stop();
  /// ```
  void stop() {
    _timer.cancel();
  }
}
