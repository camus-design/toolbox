import 'dart:async';
import 'dart:collection';

/// Measures the execution time of a synchronous function.
/// Returns the elapsed time in milliseconds.
///
/// Example:
/// ```dart
/// int executionTime = measureExecutionTime(() {
///   // Code to be measured
/// });
/// ```
int measureExecutionTime(Function function) {
  final Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  function();

  stopwatch.stop();
  final int elapsedMilliseconds = stopwatch.elapsedMilliseconds;

  return elapsedMilliseconds;
}

/// Measures the execution time of an asynchronous function.
/// Returns the elapsed time in milliseconds.
///
/// Example:
/// ```dart
/// Future<int> executionTime = measureAsyncExecutionTime(() async {
///   // Code to be measured
/// });
/// ```
Future<int> measureAsyncExecutionTime(Future<dynamic> Function() asyncFunction) async {
  final Stopwatch stopwatch = Stopwatch();
  stopwatch.start();

  await asyncFunction();

  stopwatch.stop();
  final int elapsedMilliseconds = stopwatch.elapsedMilliseconds;

  return elapsedMilliseconds;
}

final HashMap<dynamic, Stopwatch> _timers = HashMap<dynamic, Stopwatch>();
final HashMap<dynamic, Completer<int>> _completers = HashMap<dynamic, Completer<int>>();

/// Starts the timer with the specified [uniqueId].
///
/// If a timer with the same [uniqueId] already exists, it resumes the timer.
///
/// Throws an [ArgumentError] if the [uniqueId] is null.
void measureExecutionTimeStart(dynamic uniqueId) {
  ArgumentError.checkNotNull(uniqueId, 'uniqueId');

  if (!_timers.containsKey(uniqueId)) {
    _timers[uniqueId] = Stopwatch();
  }

  _timers[uniqueId]!.start();
}

/// Asynchronously starts the timer with the specified [uniqueId].
///
/// If a timer with the same [uniqueId] already exists, it resumes the timer.
///
/// Returns a [Future<int>] object that can be used to asynchronously obtain
/// the elapsed time of the timer. Throws an [ArgumentError] if the [uniqueId]
/// is null.
Future<int> asyncMeasureExecutionTimeStart(dynamic uniqueId) async {
  ArgumentError.checkNotNull(uniqueId, 'uniqueId');

  if (!_timers.containsKey(uniqueId)) {
    _timers[uniqueId] = Stopwatch();
    _completers[uniqueId] = Completer<int>();
  }

  _timers[uniqueId]!.start();
  return _completers[uniqueId]!.future;
}

/// Ends the timer with the specified [uniqueId] and returns the elapsed time in milliseconds.
///
/// Throws an [ArgumentError] if the [uniqueId] is null or if no timer exists
/// with the given [uniqueId]. If an asynchronous measure is active with the
/// same [uniqueId], it completes the corresponding [Completer] with the elapsed time.
int measureExecutionTimeEnd(dynamic uniqueId) {
  ArgumentError.checkNotNull(uniqueId, 'uniqueId');

  if (!_timers.containsKey(uniqueId)) {
    throw ArgumentError('Timer with uniqueId "$uniqueId" does not exist.');
  }

  _timers[uniqueId]!.stop();
  final int elapsedMilliseconds = _timers[uniqueId]!.elapsedMilliseconds;
  _timers.remove(uniqueId);

  if (_completers[uniqueId] != null) {
    _completers[uniqueId]?.complete(elapsedMilliseconds);
    _completers.remove(uniqueId);
  }

  return elapsedMilliseconds;
}
