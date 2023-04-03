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
      // ignore: always_specify_types
      expect(isNotNullOrEmpty([]), isFalse);
      expect(isNotNullOrEmpty(<int>[1]), isTrue);
      expect(isNotNullOrEmpty(<String>['hello', 'world']), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with set', () {
      // ignore: always_specify_types
      expect(isNotNullOrEmpty({}), isFalse);
      expect(isNotNullOrEmpty(<int>{1}), isTrue);
      expect(isNotNullOrEmpty(<String>{'hello', 'world'}), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
    });

    test('with map', () {
      // ignore: always_specify_types
      expect(isNotNullOrEmpty({}), isFalse);
      expect(isNotNullOrEmpty(<int, dynamic>{1: 'one'}), isTrue);
      expect(
        isNotNullOrEmpty(<String, dynamic>{'hello': 1, 'world': 2}),
        isTrue,
      );
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
      // ignore: always_specify_types
      expect(isNullOrEmpty([]), isTrue);
      expect(isNullOrEmpty(<int>[1]), isFalse);
      expect(isNullOrEmpty(<String>['hello', 'world']), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with set', () {
      // ignore: always_specify_types
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty(<int>{1}), isFalse);
      expect(isNullOrEmpty(<String>{'hello', 'world'}), isFalse);
      expect(isNullOrEmpty(null), isTrue);
    });

    test('with map', () {
      // ignore: always_specify_types
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty(<int, dynamic>{1: 'one'}), isFalse);
      expect(isNullOrEmpty(<String, dynamic>{'hello': 1, 'world': 2}), isFalse);
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
