import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tenk/models/practice.dart';

class PracticeCard extends StatefulWidget {
  final Practice practice;

  PracticeCard({ this.practice });

  @override
  _PracticeCardState createState() => _PracticeCardState(practice: practice);
}

class _PracticeCardState extends State<PracticeCard> {
  final Practice practice;
  int _timePassed = 0;
  Timer _timer;

  _PracticeCardState({ this.practice });

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, 
      (timer) => setState(() {
        _timePassed += 1; 
      })
    );
  }

  @override
  void initState() {
    super.initState();
    _timePassed = practice.duration;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('${widget.practice.comment}'),
              Text('$_timePassed'),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    practice.duration = _timePassed;
    _timer.cancel();
    super.dispose();
  }
}