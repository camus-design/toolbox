import 'package:logger/logger.dart';

/// This class is a wrapper around the logger package and is used for logging
/// output.
/// Most of the time you don't need to configure various parameters about logger,
/// you can use it directly.
/// It provides an easy way to output logs at different levels and allows users
/// to choose whether to output stack trace information.
///
/// By using the default constructor of CamusLogger, a singleton object logger
/// is created, which can then be used to output logs at different levels.
/// Additionally, the behavior of the log output can be controlled by passing
/// in parameters, such as the number of lines to output or whether to use colors.
///
/// Each log method can also take optional parameters to control its behavior,
/// such as the noStack parameter to control whether to output stack trace
/// information.
///
/// ## Example
/// ```dart
/// final logger = CamusLogger();
/// logger.debug('This is a debug message');
/// logger.info('This is an info message');
/// logger.warning('This is a warning message');
/// logger.error('This is an error message');
/// logger.verbose('This is a verbose message');
/// logger.wtf('This is a wtf message');
///
/// logger.debug('This is a debug message with no stack trace information',
///              noStack: true);
/// ```
///
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
