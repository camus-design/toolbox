import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('isNotNullOrEmpty', () {
    test('with string', () {
      expect(isNotNullOrEmpty(''), isFalse);
      expect(isNotNullOrEmpty(' '), isTrue);
      expect(isNotNullOrEmpty('hello'), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
      expect(''.isNotNullOrEmpty(), isFalse);
      expect(' '.isNotNullOrEmpty(), isTrue);
      expect('hello'.isNotNullOrEmpty(), isTrue);
      expect(null.isNotNullOrEmpty(), isFalse);
    });

    test('with list', () {
      // ignore: always_specify_types
      expect(isNotNullOrEmpty([]), isFalse);
      expect(isNotNullOrEmpty(<int>[1]), isTrue);
      expect(isNotNullOrEmpty(<String>['hello', 'world']), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
      // ignore: always_specify_types
      expect([].isNotNullOrEmpty(), isFalse);
      expect(<int>[1].isNotNullOrEmpty(), isTrue);
      expect(<String>['hello', 'world'].isNotNullOrEmpty(), isTrue);
      expect(null.isNotNullOrEmpty(), isFalse);
    });

    test('with set', () {
      // ignore: always_specify_types
      expect(isNotNullOrEmpty({}), isFalse);
      expect(isNotNullOrEmpty(<int>{1}), isTrue);
      expect(isNotNullOrEmpty(<String>{'hello', 'world'}), isTrue);
      expect(isNotNullOrEmpty(null), isFalse);
      // ignore: always_specify_types
      expect({}.isNotNullOrEmpty(), isFalse);
      expect(<int>{1}.isNotNullOrEmpty(), isTrue);
      expect(<String>{'hello', 'world'}.isNotNullOrEmpty(), isTrue);
      expect(null.isNotNullOrEmpty(), isFalse);
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
      // ignore: always_specify_types
      expect({}.isNotNullOrEmpty(), isFalse);
      expect(<int, dynamic>{1: 'one'}.isNotNullOrEmpty(), isTrue);
      expect(
        <String, dynamic>{'hello': 1, 'world': 2}.isNotNullOrEmpty(),
        isTrue,
      );
      expect(null.isNotNullOrEmpty(), isFalse);
    });

    test('with other types', () {
      expect(isNotNullOrEmpty(0), isTrue);
      expect(isNotNullOrEmpty(true), isTrue);
      expect(isNotNullOrEmpty(false), isTrue);
      expect(isNotNullOrEmpty(Object()), isTrue);
      expect(0.isNotNullOrEmpty(), isTrue);
      expect(true.isNotNullOrEmpty(), isTrue);
      expect(false.isNotNullOrEmpty(), isTrue);
      expect(Object().isNotNullOrEmpty(), isTrue);
    });
  });

  group('isNullOrEmpty', () {
    test('with string', () {
      expect(isNullOrEmpty(''), isTrue);
      expect(isNullOrEmpty(' '), isFalse);
      expect(isNullOrEmpty('hello'), isFalse);
      expect(isNullOrEmpty(null), isTrue);
      expect(''.isNullOrEmpty(), isTrue);
      expect(' '.isNullOrEmpty(), isFalse);
      expect('hello'.isNullOrEmpty(), isFalse);
      expect(null.isNullOrEmpty(), isTrue);
    });

    test('with list', () {
      // ignore: always_specify_types
      expect(isNullOrEmpty([]), isTrue);
      expect(isNullOrEmpty(<int>[1]), isFalse);
      expect(isNullOrEmpty(<String>['hello', 'world']), isFalse);
      expect(isNullOrEmpty(null), isTrue);
      // ignore: always_specify_types
      expect([].isNullOrEmpty(), isTrue);
      expect(<int>[1].isNullOrEmpty(), isFalse);
      expect(<String>['hello', 'world'].isNullOrEmpty(), isFalse);
      expect(null.isNullOrEmpty(), isTrue);
    });

    test('with set', () {
      // ignore: always_specify_types
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty(<int>{1}), isFalse);
      expect(isNullOrEmpty(<String>{'hello', 'world'}), isFalse);
      expect(isNullOrEmpty(null), isTrue);
      // ignore: always_specify_types
      expect({}.isNullOrEmpty(), isTrue);
      expect(<int>{1}.isNullOrEmpty(), isFalse);
      expect(<String>{'hello', 'world'}.isNullOrEmpty(), isFalse);
      expect(null.isNullOrEmpty(), isTrue);
    });

    test('with map', () {
      // ignore: always_specify_types
      expect(isNullOrEmpty({}), isTrue);
      expect(isNullOrEmpty(<int, dynamic>{1: 'one'}), isFalse);
      expect(isNullOrEmpty(<String, dynamic>{'hello': 1, 'world': 2}), isFalse);
      expect(isNullOrEmpty(null), isTrue);
      // ignore: always_specify_types
      expect({}.isNullOrEmpty(), isTrue);
      expect(<int, dynamic>{1: 'one'}.isNullOrEmpty(), isFalse);
      expect(<String, dynamic>{'hello': 1, 'world': 2}.isNullOrEmpty(), isFalse);
      expect(null.isNullOrEmpty(), isTrue);
    });

    test('with other types', () {
      expect(isNullOrEmpty(0), isFalse);
      expect(isNullOrEmpty(true), isFalse);
      expect(isNullOrEmpty(false), isFalse);
      expect(isNullOrEmpty(Object()), isFalse);
      expect(isNullOrEmpty(null), isTrue);
      expect(0.isNullOrEmpty(), isFalse);
      expect(true.isNullOrEmpty(), isFalse);
      expect(false.isNullOrEmpty(), isFalse);
      expect(Object().isNullOrEmpty(), isFalse);
      expect(null.isNullOrEmpty(), isTrue);
    });
  });
}
