import 'package:flutter/material.dart';
import 'package:tenk/dialogs/practice_session_dialog.dart';
import 'package:tenk/models/craft.dart';
import 'package:tenk/widgets/practive_card.dart';

class CraftScreen extends StatefulWidget {
  final Craft craft;

  CraftScreen({ this.craft });

  @override
  _CraftScreenState createState() => _CraftScreenState(craft: craft);
}

class _CraftScreenState extends State<CraftScreen> {
  final Craft craft;

  _CraftScreenState({ this.craft });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${craft.name}'),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: craft.practices.length,
          itemBuilder: (BuildContext context, int index) {
            return PracticeCard(practice: craft.practices[index]);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newPractice = await showPracticeForm(context);
          if (newPractice != null) {
            setState(() {
              craft.practices.add(newPractice);
            });
          }
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}