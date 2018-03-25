final Map<int, int> _days = {
  1: 31,
  2: 28, // add 1 if year is leap year
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

class DateUtil {

  // from https://en.wikipedia.org/wiki/Leap_year#Algorithm
  static bool isLeap(int year) => year % 4 == 0 && (year % 100 != 0 || year % 100 == 0);

  // note that months start at one not at zero
  static int monthLength(int month, int year) {
    if (month < 1 || month > 12 || year < 1)
      throw new Exception(
          "month should be a number in range of 1-12 and year should not be less or equal than zero");
    return month == 2 && isLeap(year) ? _days[month] + 1 : _days[month];
  }

  // https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week#Gauss's_algorithm
  static int dayOfTheWeek(int day, int month, int year) {
    if (year <= 0 || DateUtil.monthLength(month, year) < day)
      throw new Exception(
          "year cannot be negative and day should not be greater than the month's length");

    if (month == 1 || month == 2) {
      month += 12;
      year -= 1;
    }
    int c = year % 100;
    year ~/= 100;
    int d = ((day + 26 * (month + 1) ~/ 10 + c + (c ~/ 4) + (year ~/ 4) - (2 * year)) % 7).round() -1;
    return d < 0 ? d + 7 : d;
  }
}
