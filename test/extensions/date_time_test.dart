import 'package:test/test.dart';
import 'package:toolbox/toolbox.dart';

void main() {
  group('DateTimeExtension', () {
    test('dayIndexOfWeek returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Sunday
      expect(date.dayIndexOfWeek, 7);

      final DateTime date2 = DateTime(2023, 4, 4); // Tuesday
      expect(date2.dayIndexOfWeek, 2);
    });

    test('dayIndexOfMonth returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Day 2 of the month
      expect(date.dayIndexOfMonth, 2);

      final DateTime date2 = DateTime(2023, 1, 31); // Day 31 of the month
      expect(date2.dayIndexOfMonth, 31);
    });

    test('dayIndexOfYear returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Day 92 of the year
      expect(date.dayIndexOfYear, 92);

      final DateTime date2 = DateTime(2023, 1, 1); // Day 1 of the year
      expect(date2.dayIndexOfYear, 1);
    });

    test('weekIndexOfMonth returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Week 1 of the month
      expect(date.weekIndexOfMonth, 1);

      final DateTime date2 = DateTime(2023, 4, 30); // Week 5 of the month
      expect(date2.weekIndexOfMonth, 5);
    });

    test('weekIndexOfYear returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Week 14 of the year
      expect(date.weekIndexOfYear, 14);

      final DateTime date2 = DateTime(2023, 12, 31); // Week 53 of the year
      expect(date2.weekIndexOfYear, 53);
    });

    test('isLeapYear returns the correct value', () {
      final DateTime date = DateTime(2020, 1, 1); // Leap year
      expect(date.isLeapYear, true);

      final DateTime date2 = DateTime(2021, 1, 1); // Non-leap year
      expect(date2.isLeapYear, false);
    });

    test('ordinalDate returns the correct index', () {
      final DateTime date = DateTime(2023, 4, 2); // Ordinal date 92
      expect(date.ordinalDate, 92);

      final DateTime date2 = DateTime(2023, 12, 31); // Ordinal date 365
      expect(date2.ordinalDate, 365);
    });
  });
}
