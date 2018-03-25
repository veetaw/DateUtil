import 'dart:io';
import '../lib/DateUtil.dart';

main() {
  print("type a year to check if it's a leap year or not");
  int year = int.parse(stdin.readLineSync());
  bool isLeap = DateUtil.isLeap(year);
  if(isLeap)
    print("$year is a leap year!");
  else
    print("$year is a common year!");
}
