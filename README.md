# DateUtil

Library containing some missing functions to the DateTime library.

##Features:
- check if year is leap or common.
- get month's length
- determine the day of the week by date

##Usage:
```dart
import 'dart:io';  // for command line input
print("type a year to check if it's a leap year or not");
int year = int.parse(stdin.readLineSync());
bool isLeap = DateUtil.isLeap(year);
if(isLeap)
  print("$year is a leap year!");
else
  print("$year is a common year!");
```

### TODO:
- [ ] support datetime objects as function parameters
