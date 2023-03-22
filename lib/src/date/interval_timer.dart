import 'dart:async';

class CamusIntervalTimer {
  CamusIntervalTimer(this.interval, this.callback);

  final Duration interval;
  final void Function() callback;
  late Timer _timer;

  void start() {
    _timer = Timer.periodic(interval, (Timer timer) {
      callback();
    });
  }

  void stop() {
    _timer.cancel();
  }
}
