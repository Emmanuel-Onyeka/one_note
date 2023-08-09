import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import '../constants.dart';
// import '../screens/note_details_screen.dart';
import '../model/data_class.dart';
import '../model/note_model.dart';
import './note_item.dart';

class ListMode extends StatelessWidget {
  List<Note> notes = [];

  @override
  Widget build(BuildContext context) {
    notes = Provider.of<DataClass>(context).userList;
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        return NoteBookItem(
          notes: notes[index],
        );
      },
    );
  }
}
