import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

// import '../constants.dart';
// import '../screens/note_details_screen.dart';
import '../model/data_class.dart';
import '../model/note_model.dart';
import './note_item.dart';

class ListMode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: check for error
    var data = Provider.of<DataClass>(context);
    var notes = data.userList;
    return notes.isEmpty
        ? Container(
            margin: const EdgeInsets.all(10),
            child: const Text('You have no notes yet'),
          )
        : ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  data.deleteNote(notes[index].id);
                },
                background: Container(
                  alignment: Alignment.centerRight,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                key: Key(notes[index].id),
                child: NoteBookItem(
                  notes: notes[index],
                ),
              );
            },
          );
  }
}
