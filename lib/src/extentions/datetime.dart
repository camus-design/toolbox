/// Extension methods for the [DateTime] class.
extension DateTimeExtention on DateTime {
  /// Returns the day of the week as an index, where Monday is 1 and Sunday is 7.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime(2022, 04, 01);
  /// int dayIndex = date.dayIndexOfWeek; // 5 (Friday)
  /// ```
  int get dayIndexOfWeek {
    final int dayOfWeek = weekday;
    final int dayIndex = dayOfWeek == DateTime.sunday ? 7 : dayOfWeek;
    return dayIndex;
  }

  /// Returns the day of the month as an index, where the first day of the month is 1.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime(2022, 04, 01);
  /// int dayIndex = date.dayIndexOfMonth; // 1
  /// ```
  int get dayIndexOfMonth {
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final int dayOfMonth = difference(firstDayOfMonth).inDays + 1;
    return dayOfMonth;
  }

  /// Returns the day of the year as an index, where the first day of the year is 1.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime(2022, 04, 01);
  /// int dayIndex = date.dayIndexOfYear; // 91
  /// ```
  int get dayIndexOfYear {
    final DateTime firstDayOfYear = DateTime(year, 1, 1);
    final int dayOfYear = difference(firstDayOfYear).inDays + 1;
    return dayOfYear;
  }

  /// Returns the week of the month as an index, where the first week of the month is 1.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime(2022, 04, 01);
  /// int weekIndex = date.weekIndexOfMonth; // 1
  /// ```
  int get weekIndexOfMonth {
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final int firstDayOfWeek = firstDayOfMonth.weekday;
    final int firstWeekDay =
        firstDayOfWeek == DateTime.sunday ? 7 : firstDayOfWeek;
    final int day = this.day;
    final int weekIndex = (day + firstWeekDay - 2) ~/ 7 + 1;
    return weekIndex;
  }

  /// Returns the week of the year as an index, where the first week of the year is 1.
  ///
  /// Example:
  ///
  /// ```dart
  /// DateTime date = DateTime(2022, 04, 01);
  /// int weekIndex = date.weekIndexOfYear; // 13
  /// ```
  int get weekIndexOfYear {
    final DateTime firstDayOfYear = DateTime(year, 1, 1);
    final int firstDayOfWeek = firstDayOfYear.weekday;
    final int firstWeekDay =
        firstDayOfWeek == DateTime.sunday ? 7 : firstDayOfWeek;
    final int day = dayIndexOfYear;
    final int weekIndex = (day + firstWeekDay - 2) ~/ 7 + 1;
    return weekIndex;
  }

  /// Determines whether the year of the DateTime is a leap year.
  bool get isLeapYear {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  /// The ordinal date, the number of days since December 31st the previous year.
  ///
  /// January 1st has the ordinal date 1
  ///
  /// December 31st has the ordinal date 365, or 366 in leap years
  int get ordinalDate {
    const List<int> offsets = <int>[
      0,
      31,
      59,
      90,
      120,
      151,
      181,
      212,
      243,
      273,
      304,
      334
    ];
    return offsets[month - 1] + day + (isLeapYear && month > 2 ? 1 : 0);
  }
}
