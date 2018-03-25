import 'package:DateUtil/DateUtil.dart';
import 'package:test/test.dart';

void main() {
  group('tests', () {
  });
  test('test all leap years from 1904 to 2200', () {
    for (int year = 1904; year < 2200; year += 4)
      expect(DateUtil.isLeap(year), isTrue);
  });

  test('test days in a month for february 2016 (leap)', () {
    expect(DateUtil.monthLength(2, 2016), 29);
  });

  test('test days in a month for february 2017 (common)', () {
    expect(DateUtil.monthLength(2, 2017), 28);
  });

  test('test day of the week', () {
    for(int day = 1, dw = 1; day < 31; day++, dw == 6 ? dw = 0 : dw++)
      expect(DateUtil.dayOfTheWeek(day, 1, 2018), dw);
  });
}
