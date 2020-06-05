import 'package:flutter/material.dart';
import 'package:tenk/models/craft.dart';

Future<Craft> showCraftForm(BuildContext context) async {
  return showDialog<Craft>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return CraftForm();
      });
}

class CraftForm extends StatefulWidget {
  @override
  _CraftFormState createState() => _CraftFormState();
}

class _CraftFormState extends State<CraftForm> {
  String craftName;
  int goal = 10000;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter craft name'),
      content: Form(
        key: _formKey,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextFormField(
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Craft name should not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Comment', 
                  hintText: 'eg. football'
                ),
                onChanged: (value) {
                  craftName = value;
                },
              ),
            )
          ],
        )
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'Create',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              var craft = Craft(name: craftName, goal: goal);
              Navigator.of(context).pop(craft);
            }
          },
        ),
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
