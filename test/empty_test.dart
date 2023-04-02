import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('isNotNullOrEmpty', () {
    test('with string', () {
      expect(isNotNullOrEmpty(''), isFalse);
      expect(isNotNullOrEmpty(' '), isTrue);
      expect(isNotNullOrEmpty('hello'), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with list', () {
      expect(isNotNullOrEmpty([]), isFalse);
      expect(isNotNullOrEmpty([1]), isTrue);
      expect(isNotNullOrEmpty(['hello', 'world']), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with set', () {
      expect(isNotNullOrEmpty({}), isFalse);
      expect(isNotNullOrEmpty({1}), isTrue);
      expect(isNotNullOrEmpty({'hello', 'world'}), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with map', () {
      expect(isNotNullOrEmpty({}), isFalse);
      expect(isNotNullOrEmpty({1: 'one'}), isTrue);
      expect(isNotNullOrEmpty({'hello': 1, 'world': 2}), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with other types', () {
      expect(isNotNullOrEmpty(0), isTrue);
      expect(isNotNullOrEmpty(true), isTrue);
      expect(isNotNullOrEmpty(false), isTrue);
      expect(isNotNullOrEmpty(Object()), isTrue);
    });
  });

  group('isNullOrEmpty', () {
    test('with string', () {
      expect(isNullOrEmpty(''), isTrue);
      expect(isNullOrEmpty(' '), isFalse);
      expect(isNullOrEmpty('hello'), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with list', () {
      expect(isNullOrEmpty([]), isTrue);
      expect(isNullOrEmpty([1]), isFalse);
      expect(isNullOrEmpty(['hello', 'world']), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with set', () {
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty({1}), isFalse);
      expect(isNullOrEmpty({'hello', 'world'}), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with map', () {
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty({1: 'one'}), isFalse);
      expect(isNullOrEmpty({'hello': 1, 'world': 2}), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with other types', () {
      expect(isNullOrEmpty(0), isFalse);
      expect(isNullOrEmpty(true), isFalse);
      expect(isNullOrEmpty(false), isFalse);
      expect(isNullOrEmpty(Object()), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });
  });
}
