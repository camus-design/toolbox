import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('CamusLogger', () {
    late CamusLogger camusLogger;

    setUp(() {
      camusLogger = CamusLogger(
        level: Level.debug,
        colors: false,
        printEmojis: false,
        printTime: false,
      );
    });

    test('debug', () {
      camusLogger.debug('This is a debug message');
    });

    test('info', () {
      camusLogger.info('This is an info message');
    });

    test('warning', () {
      camusLogger.warning('This is a warning message');
    });

    test('error', () {
      camusLogger.error('This is an error message');
    });

    test('verbose', () {
      camusLogger.verbose('This is a verbose message');
    });

    test('wtf', () {
      camusLogger.wtf('This is a wtf message');
    });

    test('debug with no stack', () {
      camusLogger.debug(
        'This is a debug message with no stack trace information',
        noStack: true,
      );
    });
  });
}
