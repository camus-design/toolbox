import 'dart:async';

import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('Throttle function', () {
    test('throttles the function call', () async {
      int callCount = 0;
      final Function throttledIncrement = camusThrottle(
        () => callCount++,
        milliseconds: 100,
      );

      for (int i = 0; i < 10; i++) {
        throttledIncrement();
      }
      expect(callCount, 1); // Initial call should be executed

      await Future<void>.delayed(
        const Duration(milliseconds: 150),
      );

      throttledIncrement();
      await Future<void>.delayed(
        const Duration(milliseconds: 150),
      ); // Wait for the throttle delay to pass

      expect(
        callCount,
        2,
      ); // Only one additional call should be executed after the delay
    });
  });
}
