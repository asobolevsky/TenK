import 'package:flutter/material.dart';
import 'package:tenk/models/practice.dart';

Future<Practice> showPracticeForm(BuildContext context) async {
  return showDialog<Practice>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return PracticeForm();
      });
}

class PracticeForm extends StatefulWidget {
  @override
  _PracticeFormState createState() => _PracticeFormState();
}

class _PracticeFormState extends State<PracticeForm> {
  String comment;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Start new practice session'),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: 'Craft name', 
              ),
              onChanged: (value) {
                comment = value;
              },
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Start',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () async {
            Practice newPractice = Practice();
            newPractice.start = (DateTime.now().millisecondsSinceEpoch.abs() / 1000).round();
            newPractice.comment = comment;
            Navigator.of(context).pop(newPractice);
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ]
    );
  }
}