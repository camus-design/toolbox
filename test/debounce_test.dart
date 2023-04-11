import 'dart:async';

import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('camusDebounce', () {
    test('should call the callback once after the specified time has elapsed',
        () async {
      int count = 0;
      final Function debouncedFunction = camusDebounce(
        () {
          count++;
        },
        milliseconds: 500,
      );

      debouncedFunction();

      // The callback function should not have been executed yet.
      expect(count, 0);

      // Wait for more than the specified time.
      await Future<void>.delayed(const Duration(milliseconds: 600));

      // The callback function should have been executed once.
      expect(count, 1);
    });

    test('should reset the timer if called multiple times', () async {
      int count = 0;
      final Function debouncedFunction = camusDebounce(
        () {
          count++;
        },
        milliseconds: 500,
      );

      debouncedFunction();
      debouncedFunction();
      debouncedFunction();

      // The callback function should not have been executed yet.
      expect(count, 0);

      // Wait for less than the specified time.
      await Future<void>.delayed(const Duration(milliseconds: 400));

      // The callback function should not have been executed yet.
      expect(count, 0);

      await Future<void>.delayed(const Duration(milliseconds: 100));

      debouncedFunction();

      // Wait for more than the specified time.
      await Future<void>.delayed(const Duration(milliseconds: 600));

      // The callback function should have been executed twice.
      expect(count, 2);
    });
  });
}
