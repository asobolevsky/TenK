import 'package:flutter/material.dart';
import 'package:tenk/models/craft.dart';

class CraftCard extends StatelessWidget {
  final Craft craft;

  CraftCard({this.craft});

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
              Text('${craft.name}'),
              Text('${craft.practicedTimeInHours()} / ${craft.goal}'),
            ],
          ),
        ),
      ),
    );
  }
}
