import 'package:flutter_test/flutter_test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('reverse', () {
    test('returns reversed string', () {
      expect('hello'.reverse(), equals('olleh'));
      expect('12345'.reverse(), equals('54321'));
      expect(''.reverse(), equals(''));
    });
  });

  group('isNumber', () {
    test('returns true if string represents a number', () {
      expect('123'.isNumber(), isTrue);
      expect('-123'.isNumber(), isTrue);
      expect('123.45'.isNumber(), isTrue);
      expect('0.1e-10'.isNumber(), isTrue);
    });

    test('returns false if string does not represent a number', () {
      expect('abc'.isNumber(), isFalse);
      expect('123abc'.isNumber(), isFalse);
      expect('123.45.67'.isNumber(), isFalse);
      expect(''.isNumber(), isFalse);
    });
  });

  group('isDigit', () {
    test('returns true if string represents a digit', () {
      expect('0'.isDigit(), isTrue);
      expect('1'.isDigit(), isTrue);
      expect('9'.isDigit(), isTrue);
    });

    test('returns false if string does not represent a digit', () {
      expect('a'.isDigit(), isFalse);
      expect(''.isDigit(), isFalse);
    });
  });

  group('addCharAtPosition', () {
    test('adds character at specified position', () {
      expect('hello'.addCharAtPosition('*', 2), equals('he*llo'));
    });

    test('repeatedly adds character at specified position', () {
      expect(
        'hello'.addCharAtPosition('*', 2, repeat: true),
        equals('he*ll*o'),
      );
    });

    test('throws AssertionError if position is out of range', () {
      expect(() => 'hello'.addCharAtPosition('*', -1), throwsAssertionError);
      expect(() => 'hello'.addCharAtPosition('*', 10), throwsAssertionError);
    });
  });

  group('toCharacterBreakString', () {
    test(
        'returns string with zero-width space characters between each character',
        () {
      expect(
        'hello'.toCharacterBreakString(),
        equals('h\u{200B}e\u{200B}l\u{200B}l\u{200B}o'),
      );
    });

    test('returns empty string if string is empty', () {
      expect(''.toCharacterBreakString(), equals(''));
    });
  });

  group('capitalize', () {
    test('capitalizes first letter of string', () {
      expect('hello'.capitalize(), equals('Hello'));
      expect('Hello'.capitalize(), equals('Hello'));
      expect(''.capitalize(), equals(''));
    });
  });

  group('toChunks', () {
    test('splits string into chunks of specified size', () {
      expect(
        'hello world'.toChunks(3),
        equals(<String>['hel', 'lo ', 'wor', 'ld']),
      );
      expect(
        'hello world'.toChunks(4),
        equals(<String>['hell', 'o wo', 'rld']),
      );
      expect(''.toChunks(3), equals(<String>['']));
    });
  });
}
