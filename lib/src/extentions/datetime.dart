extension DateTimeExtention on DateTime {
  int get dayIndexOfWeek {
    final int dayOfWeek = weekday;
    final int dayIndex = dayOfWeek == DateTime.sunday ? 7 : dayOfWeek;
    return dayIndex;
  }

  int get dayIndexOfMonth {
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final int dayOfMonth = difference(firstDayOfMonth).inDays + 1;
    return dayOfMonth;
  }

  int get dayIndexOfYear {
    final DateTime firstDayOfYear = DateTime(year, 1, 1);
    final int dayOfYear = difference(firstDayOfYear).inDays + 1;
    return dayOfYear;
  }

  int get weekIndexOfMonth {
    final DateTime firstDayOfMonth = DateTime(year, month, 1);
    final int firstDayOfWeek = firstDayOfMonth.weekday;
    final int firstWeekDay =
        firstDayOfWeek == DateTime.sunday ? 7 : firstDayOfWeek;
    final int day = this.day;
    final int weekIndex = (day + firstWeekDay - 2) ~/ 7 + 1;
    return weekIndex;
  }

  int get weekIndexOfYear {
    final DateTime firstDayOfYear = DateTime(year, 1, 1);
    final int firstDayOfWeek = firstDayOfYear.weekday;
    final int firstWeekDay =
        firstDayOfWeek == DateTime.sunday ? 7 : firstDayOfWeek;
    final int day = dayIndexOfYear;
    final int weekIndex = (day + firstWeekDay - 2) ~/ 7 + 1;
    return weekIndex;
  }

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
