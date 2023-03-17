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
}
