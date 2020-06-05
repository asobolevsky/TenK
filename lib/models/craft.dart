import 'package:tenk/models/practice.dart';

class Craft {
  String name;
  int goal;
  List<Practice> practices = [];

  Craft({this.name, this.goal});

  Duration practicedTime() {
    int totalTime = 0;
    for (Practice practice in practices) {
      totalTime += practice.duration;
    }
    return Duration(seconds: totalTime);
  }

  int practicedTimeInHours() {
    return practicedTime().inHours;
  }
}