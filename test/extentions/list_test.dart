import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group(
    'ListExtension',
    () {
      test(
        'mapIndexed() should apply the function to each element and index',
        () {
          final List<String> list = <String>['apple', 'banana', 'cherry'];
          final List<String> expected = <String>[
            '0: apple',
            '1: banana',
            '2: cherry'
          ];
          final Iterable<String> result =
              list.mapIndexed((String fruit, int index) => '$index: $fruit');
          expect(result, orderedEquals(expected));
        },
      );

      test(
        'forEachIndexed() should execute the function on each element and index',
        () {
          final List<String> list = <String>['apple', 'banana', 'cherry'];
          final List<String> expected = <String>[
            '0: apple',
            '1: banana',
            '2: cherry'
          ];
          final List<String> result = <String>[];
          list.forEachIndexed(
              (String fruit, int index) => result.add('$index: $fruit'));
          expect(result, orderedEquals(expected));
        },
      );
    },
  );
}
