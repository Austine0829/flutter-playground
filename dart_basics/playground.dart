
class weekDayString {
  static final List<String> _weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  static String now() {
    return _weekDays[DateTime.now().weekday - 1];
  }
}

class Listen {
  final String date;
  final String weekDay;

  Listen({
    required this.date,
    required this.weekDay
  });
}

void main() {
  // Map<String, int> map = {
  //   "KeyOne": 1,
  //   "KeyTwo": 2
  // };

  // map.forEach((key, value) {
  //   print(key);
  //   print(value);
  // });
  
  List<Map<String, Listen>> listens = [
    {"listen": Listen(date: "2026-10-05", weekDay: "Sun")},
    {"listen": Listen(date: "2026-11-05", weekDay: "Mon")}
  ];

  List<dynamic> list = listens.asMap().entries.map((entry) {
    
  }).toList();


  
}