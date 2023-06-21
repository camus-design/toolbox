import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('Execution Time Measurement', () {
    // A sample function for testing
    void someFunction() {
      // Some code to be measured
      for (int i = 0; i < 100000000; i++) {
        // Some computation
      }
    }

    // A sample async function for testing
    Future<void> someAsyncFunction() async {
      // Some asynchronous code to be measured
      for (int i = 0; i < 10; i++) {
        // Some computation
        await Future<void>.delayed(const Duration(milliseconds: 1));
      }
    }

    test('measureExecutionTime', () {
      // Act
      final int elapsedMilliseconds = measureExecutionTime(someFunction);

      // Assert
      expect(elapsedMilliseconds, greaterThan(0));
    });

    test('measureAsyncExecutionTime', () async {
      // Act
      final int elapsedMilliseconds = await measureAsyncExecutionTime(() async {
        await someAsyncFunction();
      });

      // Assert
      expect(elapsedMilliseconds, greaterThan(0));
    });

    test('measureExecutionTimeStart and measureExecutionTimeEnd', () {
      // Arrange
      const String uniqueId = 'testUniqueId';

      // Act
      measureExecutionTimeStart(uniqueId);
      someFunction();
      final int elapsedMilliseconds = measureExecutionTimeEnd(uniqueId);

      // Assert
      expect(elapsedMilliseconds, greaterThan(0));
    });

    test('asyncMeasureExecutionTimeStart and measureExecutionTimeEnd', () async {
      // Arrange
      const String uniqueId = 'testUniqueId';

      // Act
      final Future<int> measureFuture = asyncMeasureExecutionTimeStart(uniqueId);
      someFunction();
      final int elapsedMilliseconds = measureExecutionTimeEnd(uniqueId);
      final int measureResult = await measureFuture;

      // Assert
      expect(elapsedMilliseconds, greaterThan(0));
      expect(measureResult, equals(elapsedMilliseconds));
    });
  });
}
