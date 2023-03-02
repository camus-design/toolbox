import 'package:logger/logger.dart';

/// A wrapper around the logger package.
/// TODO: Detailed documentation.
class CamusLogger {
  /// Singleton factory
  factory CamusLogger({
    Level? level,
    int? methodCount,
    int? errorMethodCount,
    int? lineLength,
    bool? colors,
    bool? printEmojis,
    bool? printTime,
  }) {
    if (_singleton != null) {
      return _singleton!;
    }

    bool isDebug = false;
    assert(() {
      isDebug = true;
      return true;
    }());
    final Level defaultLevel = isDebug ? Level.debug : Level.nothing;

    final Logger logger = Logger(
      level: level ?? defaultLevel,
      printer: PrettyPrinter(
        methodCount: methodCount ?? 2,
        errorMethodCount: errorMethodCount ?? 8,
        lineLength: lineLength ?? 120,
        colors: colors ?? true,
        printEmojis: printEmojis ?? true,
        printTime: printTime ?? true,
      ),
    );
    final Logger loggerNoStack = Logger(
      level: level ?? defaultLevel,
      printer: PrettyPrinter(methodCount: 0),
    );
    _singleton = CamusLogger._internal(logger, loggerNoStack);
    return _singleton!;
  }

  CamusLogger._internal(this._logger, this._loggerNoStack);

  final Logger _logger;
  final Logger _loggerNoStack;
  static CamusLogger? _singleton;

  /// Log a message at level [Level.debug].
  void debug(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.d(message, error, stackTrace);
      return;
    }
    _logger.d(message, error, stackTrace);
  }

  /// Log a message at level [Level.error].
  void error(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.e(message, error, stackTrace);
      return;
    }
    _logger.e(message, error, stackTrace);
  }

  /// Log a message at level [Level.info].
  void info(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.i(message, error, stackTrace);
      return;
    }
    _logger.i(message, error, stackTrace);
  }

  /// Log a message at level [Level.warning].
  void warning(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.w(message, error, stackTrace);
      return;
    }
    _logger.w(message, error, stackTrace);
  }

  /// Log a message at level [Level.verbose].
  void verbose(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.v(message, error, stackTrace);
      return;
    }
    _logger.v(message, error, stackTrace);
  }

  /// Log a message at level [Level.wtf].
  void wtf(
    dynamic message, {
    dynamic error,
    StackTrace? stackTrace,
    bool? noStack,
  }) {
    if (noStack == true) {
      _loggerNoStack.wtf(message, error, stackTrace);
      return;
    }
    _logger.wtf(message, error, stackTrace);
  }
}
