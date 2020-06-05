import 'package:flutter/material.dart';
import 'package:tenk/dialogs/craft_dialog.dart';
import 'package:tenk/models/craft.dart';
import 'package:tenk/widgets/craft_card.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CraftsList();
  }
}

class CraftsList extends StatefulWidget {
  @override
  _CraftsListState createState() => _CraftsListState();
}

class _CraftsListState extends State<CraftsList> {
  List<Craft> _crafts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('10K'),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: _crafts.length,
          itemBuilder: (BuildContext context, int index) {
            return CraftCard(craft: _crafts[index]);
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var newCraft = await showCraftForm(context);
          if (newCraft != null) {
            setState(() {
              _crafts.add(newCraft);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}