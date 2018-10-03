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
  static bool isLeap(int year) =>
      year % 4 == 0 && (year % 100 != 0 || year % 100 == 0);

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
    int d = ((day +
                    26 * (month + 1) ~/ 10 +
                    c +
                    (c ~/ 4) +
                    (year ~/ 4) -
                    (2 * year)) %
                7)
            .round() -
        1;
    return d < 0 ? d + 7 : d;
  }

  //https://en.wikipedia.org/wiki/Computus#Algorithms
  static DateTime getEasterDate(int year) {

    if(year < 1970)
      throw new Exception(
        "year shouldn't be less than 1970");

    int day, month;
    int a, b, c, d, e, m, n;

    switch ((year / 100).floor()) {
      case 15: // 1583 - 1599 (FALL THROUGH)
      case 16: // 1600 - 1699
        m = 22;
        n = 2;
        break;

      case 17: // 1700 - 1799
        m = 23;
        n = 3;
        break;

      case 18: // 1800 - 1899
        m = 23;
        n = 4;
        break;

      case 19: // 1900 - 1999 (FALL THROUGH)
      case 20: // 2000 - 2099
        m = 24;
        n = 5;
        break;

      case 21: // 2100 - 2199
        m = 24;
        n = 6;
        break;

      case 22: // 2200 - 2299
        m = 25;
        n = 0;
        break;

      case 23: // 2300 - 2399
        m = 26;
        n = 1;
        break;

      case 24: // 2400 - 2499
        m = 25;
        n = 1;
        break;
    }

    a = year % 19;
    b = year % 4;
    c = year % 7;
    d = (19 * a + m) % 30;
    e = (2 * b + 4 * c + 6 * d + n) % 7;
    day = d + e;

    if (d + e < 10) {
      day += 22;
      month = 3;
    } else {
      day -= 9;
      month = 4;

      if ((day == 26) || ((day == 25) && (d == 28) && (e == 6) && (a > 10)))
        day -= 7;
    }

    return new DateTime(year, month = month, day = day);

  }

}
