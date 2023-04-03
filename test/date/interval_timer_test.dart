import 'dart:async';
import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('CamusIntervalTimer', () {
    test('callback is called at fixed interval', () async {
      // Arrange
      const Duration duration = Duration(milliseconds: 100);
      int counter = 0;
      final CamusIntervalTimer timer = CamusIntervalTimer(duration, () {
        counter++;
      });

      // Act
      timer.start();

      // Wait for the callback to be called 5 times
      await Future<void>.delayed(duration * 5);

      timer.stop();

      // Assert
      expect(counter, 5);
    });

    test('timer can be stopped', () async {
      // Arrange
      const Duration duration = Duration(milliseconds: 100);
      int counter = 0;
      final CamusIntervalTimer timer = CamusIntervalTimer(duration, () {
        counter++;
      });

      // Act
      timer.start();

      // Wait for 1 second
      await Future<void>.delayed(const Duration(seconds: 1));

      timer.stop();

      // Wait for another 1 second
      await Future<void>.delayed(const Duration(seconds: 1));

      // Assert
      expect(counter, greaterThan(0));
      expect(counter, lessThan(11));
    });
  });
}
